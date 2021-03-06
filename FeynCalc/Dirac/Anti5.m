(* ::Package:: *)



(* :Title: Anti5								*)

(*
	This software is covered by the GNU General Public License 3.
	Copyright (C) 1990-2016 Rolf Mertig
	Copyright (C) 1997-2016 Frederik Orellana
	Copyright (C) 2014-2016 Vladyslav Shtabovenko
*)

(* :Summary:  Anti5 anticommutes gamma5's right or left			    *)

(* ------------------------------------------------------------------------ *)

Anti5::usage =
"Anti5[exp] anticommutes all gamma5 one time to the right. \
Anti5[exp, n] anticommutes all gamma5 n times to the right. \
Anti5[exp, -n] anticommutes all gamma5 n times to the left.";

(* ------------------------------------------------------------------------ *)


Begin["`Package`"]
End[]

Begin["`Anti5`Private`"]

Anti5[expr_Plus, n_] :=
	Map[Anti5[#,n]&,expr];
Anti5[expr_, _] :=
	expr /; FreeQ2[FeynCalcInternal[expr], {DiracGamma[5],DiracGamma[6],DiracGamma[7]}];
Anti5[expr_, Infinity] :=
	FixedPoint[Anti5, expr, $RecursionLimit];
Anti5[expr_, -Infinity] :=
	FixedPoint[Anti5[#,-1]&, expr, $RecursionLimit];
Anti5[expr_, n_Integer?Positive] :=
	Nest[Anti5, expr, n]/; (n =!= 1);
Anti5[expr_, n_Integer?Negative] :=
	Nest[Anti5[#,-1]&, expr, -n] /; (n =!= -1);
Anti5[expr_] :=
	Anti5[expr, 1];

Anti5[xx_, n_] :=
	Block[ {HoldDOT, ruleBMHVRight, ruleAnticommute, ruleNaiveRight,
			ruleBMHVLeft, ruleNaiveLeft, temp, result},
		temp = FeynCalcInternal[xx] /. {1/2+DiracGamma[5]/2:>DiracGamma[6],1/2-DiracGamma[5]/2:>DiracGamma[7]} /. DOT -> HoldDOT;
		HoldDOT[] :=
			1;
		HoldDOT[a___, DiracGamma[5], DiracGamma[5], b___ ] :=
			HoldDOT[a,b];
		HoldDOT[a___, DiracGamma[6], DiracGamma[6], b___ ] :=
			HoldDOT[a,b];
		HoldDOT[a___, DiracGamma[7], DiracGamma[7], b___ ] :=
			HoldDOT[a,b];

		HoldDOT[a___, DiracGamma[6], b___]:=
			(1/2)HoldDOT[a, DiracGamma[5], b] + (1/2)*HoldDOT[a, b]/;
			!MatchQ[{b},{DiracGamma[5],___}|{DiracGamma[6],___}|{DiracGamma[7],___}] &&
			!MatchQ[{a},{___,DiracGamma[5]}|{___,DiracGamma[6]}|{___,DiracGamma[7]}];
		HoldDOT[a___, DiracGamma[7], b___]:=
			-(1/2)HoldDOT[a, DiracGamma[5], b] + (1/2)*HoldDOT[a, b]/;
			!MatchQ[{b},{DiracGamma[5],___}|{DiracGamma[6],___}|{DiracGamma[7],___}] &&
			!MatchQ[{a},{___,DiracGamma[5]}|{___,DiracGamma[6]}|{___,DiracGamma[7]}];

		HoldDOT[a___, DiracGamma[5], DiracGamma[6],	b___]:=
			HoldDOT[a, DiracGamma[6], b];
		HoldDOT[a___, DiracGamma[5], DiracGamma[7],	b___]:=
			-HoldDOT[a, DiracGamma[7], b];
		HoldDOT[a___, DiracGamma[6], DiracGamma[5],	b___]:=
			HoldDOT[a, DiracGamma[6], b];
		HoldDOT[a___, DiracGamma[7], DiracGamma[5],	b___]:=
			-HoldDOT[a, DiracGamma[5], b];
		HoldDOT[a___, DiracGamma[6], DiracGamma[6],	b___]:=
			HoldDOT[a, DiracGamma[6], b];
		HoldDOT[a___, DiracGamma[6], DiracGamma[7],	b___]:=
			0;
		HoldDOT[a___, DiracGamma[7], DiracGamma[7],	b___]:=
			HoldDOT[a, DiracGamma[7], b];
		HoldDOT[a___, DiracGamma[7], DiracGamma[6],	b___]:=
			0;
		FCPrint[3,"Entering Anti5 with  ", FeynCalcInternal[xx]];
		ruleAnticommute = {

			(* Every scheme, 4 dimensions, move gamma^5 to the right *)
			HoldDOT[a___, DiracGamma[5], DiracGamma[(y: LorentzIndex | ExplicitLorentzIndex | Momentum)[x_]],
			b___]/; (n===1) :> (-HoldDOT[a, DiracGamma[y[x]], DiracGamma[5],b]),

			(* Naive scheme, D dimensions, move gamma^5 to the right *)
			HoldDOT[a___, DiracGamma[5], DiracGamma[(y: LorentzIndex | ExplicitLorentzIndex | Momentum)[x_,
				dim_Symbol], dim_Symbol], b___]/; (n===1) && !$BreitMaison && !$Larin :>
					-HoldDOT[a, DiracGamma[y[x, dim], dim], DiracGamma[5],b],

			(* BMHV scheme, D dimensions, move gamma^5 to the right *)
			HoldDOT[a___, DiracGamma[5], DiracGamma[(y: LorentzIndex | ExplicitLorentzIndex | Momentum)[x_,
				dim_Symbol], dim_Symbol ], b___ ]/; (n===1) && $BreitMaison && !$Larin :>
					-HoldDOT[a, DiracGamma[y[x, dim], dim], DiracGamma[5], b] +
					2 HoldDOT[a, DiracGamma[y[x, dim-4], dim-4], DiracGamma[5],b],

			(* BMHV scheme, D-4 dimensions, move gamma^5 to the right *)
			HoldDOT[a___, DiracGamma[5], DiracGamma[(y: LorentzIndex | ExplicitLorentzIndex | Momentum)[x_,
				dim_Symbol - 4], dim_Symbol - 4], b___ ]/; (n===1) && $BreitMaison && !$Larin :>
					HoldDOT[a, DiracGamma[y[x, dim-4], dim - 4], DiracGamma[5], b],
			(*-------------------------------------------------------------------------------------*)

			(* Every scheme, 4 dimensions, move gamma^5 to the left *)
			HoldDOT[a___, DiracGamma[(y: LorentzIndex | ExplicitLorentzIndex | Momentum)[x_]], DiracGamma[5],
				b___]/; (n===-1) :> -HoldDOT[a, DiracGamma[5], DiracGamma[y[x]], b],

			(* Naive scheme, D dimensions, move gamma^5 to the left *)
			HoldDOT[a___, DiracGamma[(y: LorentzIndex | ExplicitLorentzIndex | Momentum)[x_,
				dim_Symbol], dim_Symbol], DiracGamma[5], b___]/; (n===-1) && !$BreitMaison && !$Larin :>
					-HoldDOT[a, DiracGamma[5], DiracGamma[y[x, dim], dim], b],

			(* BMHV scheme, D dimensions, move gamma^5 to the left *)
			HoldDOT[a___, DiracGamma[(y: LorentzIndex | ExplicitLorentzIndex | Momentum)[x_,
				dim_Symbol], dim_Symbol ], DiracGamma[5], b___ ]/; (n===-1) && $BreitMaison && !$Larin :>
					-HoldDOT[a, DiracGamma[5], DiracGamma[y[x, dim], dim], b] +
					2 HoldDOT[a, DiracGamma[5], DiracGamma[y[x, dim-4], dim-4], b],

			(* BMHV scheme, D-4 dimensions, move gamma^5 to the left *)
			HoldDOT[a___, DiracGamma[(y: LorentzIndex | ExplicitLorentzIndex | Momentum)[x_,
				dim_Symbol - 4], dim_Symbol - 4], DiracGamma[5], b___ ]/; (n===-1) && $BreitMaison && !$Larin  :>
					HoldDOT[a, DiracGamma[5], DiracGamma[y[x, dim-4], dim - 4], b]
			};
		result = temp /. ruleAnticommute /. HoldDOT -> DOT;
		FCPrint[3,"Leaving Anti5 with  ", result];
		result
	]/; (n===1 || n===-1);

FCPrint[1,"Anti5.m loaded."];
End[]
