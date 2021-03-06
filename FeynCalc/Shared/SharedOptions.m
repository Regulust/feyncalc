(* ::Package:: *)

(* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ *)

(* :Title: CoreOptions														*)

(*
	This software is covered by the GNU General Public License 3.
	Copyright (C) 1990-2016 Rolf Mertig
	Copyright (C) 1997-2016 Frederik Orellana
	Copyright (C) 2014-2016 Vladyslav Shtabovenko
*)

(* :Summary:  Options shared by various FeynCalc objects and functions	    *)

(* ------------------------------------------------------------------------ *)

ClearHeads::usage = "ClearHeads is an option of FCLoopIsolate, FCDiracIsolate \
and other functions. It takes a list of heads that will be replaced by Identity in \
the isolating function. This is useful for cases when we first apply \
the isolating function to an expression, then simplify the isolated expression and \
finally want to apply the isolating function again to pull out the simplified expressions \
out of the old heads.";

Collecting::usage =
"Collecting is an option of multiple functions. Setting it to True will trigger \
some kind of collecting of the result.";

CouplingConstant::usage =
"CouplingConstant is an option for several Feynman rule functions and \
for CovariantD and FieldStrength.";

Dimension::usage =
"Dimension is an option for DiracMatrix, DiracSlash, FourVector, \
LeviCivita, MetricTensor, SetMandelstam, OneLoop and ScalarProduct. \
The default setting is sometimes 4, sometimes D. \
The setting should always be 4, a symbol (D, n, ...), or \
(D-4), (n-4), ... .";

DimensionalReduction::usage=
"DimensionalReduction is an option for TID and OneLoopSimplify.";

DiracTraceEvaluate::usage =
"DiracTraceEvaluate is an option for DiracTrace and TR. \
If set to False, DiracTrace remains unevaluated.";

Divideout::usage =
"Divideout is an option for OPEInt and OPEInsert. \
The setting is divided out at the end.";

EpsContract::usage=
"EpsContract is an option of Contract specifying whether Levi-Civita \
tensors Eps[...] will be contracted, i.e., products \
of two Eps are replaced via the determinant formula.";

EpsDiscard::usage=
"EpsDiscard is an option for FeynCalc2FORM and SquareAmplitude. \
If set to True all Levi-Civita tensors are replaced by 0 after contraction.";

EpsilonOrder::usage =
"EpsilonOrder is an option of OPEIntegrateDelta and RHI. The setting \
determines the order n (Epsilon^n) which should be kept.";

ExceptHeads::usage = "ExceptHeads is an option of FCLoopIsolate, \
FCDiracIsolate and other functions. It takes a list of heads that  \
are not allowed to appear inside isolated expression. For example, \
ExceptHeads -> {DiracGamma} in FCLoopIsolate blocks loop integrals \
where loop momenta are contracted with Dirac matrices";

Expanding::usage =
"Expanding is an option for DotSimplify, Calc, Contract, DiracSimplify, \
SUNSimplify, etc. As option for Contract it specifies whether expansion w.r.t. \
LorentzIndex is done BEFORE contraction. \
\n
If set to False in DiracSimplify or SUNSimplify, \
only a limited set of simplifications \
(multiplicative linearity etc.) is \
performed. For DotSimplity, it determines \
whether noncommutative expansion is done.";

FCCheckSyntax::usage = "FCCheckSyntax is an option for several FeynCalc \
functions that require correct syntax in order to produce sensible results. \
If set to True, those functions will try to check the syntax of the input
expressions to detect possible inconsistencies (which mostly come from the
users not familiar with FeynCalc). However, on large expressions such checks
may cost a lot of performance, which is why this option is set to False \
by default.";

Factoring::usage = "Factoring is an option for Collect2, Contract, \
Tr and more functions. If set to True, the result will be \
factored, using Factor2. If set to any function f, this function \
will be used.";

ExtraFactor::usage=
"ExtraFactor is an option for SquareAmplitude, FermionSpinSum and \
DoPolarizationSums. The setting ExtraFactor -> fa \
multiplies the whole amplitude with the factor fa before squaring.";

Factorout::usage =
"Factorout is an option for OPEInt and OPEIntegrate.";

FCVerbose::usage =
"FCVerbose is an option for several functions that allows to specify \
a local value of $VeryVerbose inside those functions. When set to a positive \
integer, all the debugging information inside the function will be given according \
to the value of FCVerbose, while the debugging output of other functions will \
be still governed by the value of $VeryVerbose";

FCIntegrate::usage=
"FCIntegrate is an option of certain Feynman integral related functions. \
It determines which integration function is used to evaluate analytic \
integrals. Possible settings include Integrate, NIntegrate,
(DOT[Integratedx@@#2, #1] &).";

FCNIntegrate::usage=
"FCNIntegrate is an option of certain Feynman integral related functions \
which may return output containing both integrals that can be evaluated \
and integrals that can only be evaluated numerically. \
It then determines which integration function is used to evaluate numeric \
integrals. Possible settings include NIntegrate, (0*#1)&, \
(DOT[Integratedx@@#2, #1] &).";

FeynmanParameterNames::usage=
"FeynmanParameterNames is an option for FeynmanParametrize and \
FeynmanParametrize.";

FinalSubstitutions::usage =
"FinalSubstitutions is an option for OneLoop, OneLoopSum, \
Write2, FeynCalcExternal and FeynCalcInternal. All substitutions indicated \
hereby are done at the end of the calculation.";

Gauge::usage =
"Gauge is an option for GluonProgagator. If set to 1 the \
't Hooft Feynman gauge is used.";

IncludePair::usage =
"IncludePair is an option for FC2RHI, FC2TLI and FeynAmpDenominatorSimplify. \
Possible settings are True and False.";

InitialSubstitutions::usage =
"InitialSubstitutions is an option for OneLoop and OneLoopSum \
and Write2. All substitutions indicated hereby are done at the \
end of the calculation.";

IntegralTable::usage=
"IntegralTable is an option of OneLoopSimplify, TwoLoopSimplify and \
FeynAmpDenominatorSimplify. It may be set to a list of the form: \
{FCIntegral[ ... ] :> bla, ...}.";

IntermediateSubstitutions::usage =
"IntermediateSubstitutions is an option for OneLoop and \
and SquareAmplitude. All substitutions indicated hereby are done at \
an intermediate stage of the calculation.";

IsolateNames::usage =
"IsolateNames is an option for Isolate and Collect2. \
Its default setting is KK. Instead of a symbol the \
setting may also be a list with the names of the abbrevations.";

KK::usage =
"KK[i] is the default setting of IsolateNames, \
which is the head of abbreviations used by Isolate. \
A KK[i] returned by Isolate is given in HoldForm and can be \
recovered by ReleaseHold[KK[i]].";

Loop::usage=
"Loop is an option indicating the number of (virtual) loops.";

LorentzIndexNames::usage =
"LorentzIndexNames is an option for FCFAConvert, FCCanonicalizeDummyIndices \
and other functions. It renames the generic dummy Lorentz indices to the indices \
in the supplied list.";

PaVeIntegralHeads::usage=
"PaVeIntegralHeads is an option for FCLoopIsolate, FCLoopSplit and other \
functions. It gives a list of heads that denote Passarino-Veltman integrals";

Mandelstam::usage =
"Mandelstam is an option for DiracTrace, OneLoop, OneLoopSum, Tr \
and TrickMandelstam.  A typical setting is \
Mandelstam -> {s, t, u, m1^2 + m2^2 + m3^2 + m4^2}, \
which stands for  s + t + u = m1^2 + m2^2 + m3^2 +  m4^2. \
If other than four-particle processes are calculated the \
setting should be: Mandelstam -> {}.";

PairCollect::usage =
"PairCollect is an option for DiracTrace specifying if \
the result is collected with respect to Pair's.";

PaVeAutoReduce::usage =
"PaVEAutoConvert is an option of PaVe and other functions that work with PaVe functions. \
When set to True, for some special cases PaVe functions will be automatically reduced \
to simpler expressions. Otherwise, PaVe functions will not be further simplified \
unless explicitly evaluated by PaVeReduce.";

PaVeAutoOrder::usage =
"PaVeAutoOrder is an option of PaVe  and other functions that work with PaVe functions. \
When set to True, for some special cases (mostly for C and D scalar functions) \
the arguments of the PaVe functions will be automatically ordered by using \
the known symmetries between those arguments.";

PaVeOrderList::usage=
"PaVeOrderList is an option for PaVeOrder and PaVeReduce, \
specifying in which order the arguments of D0 are to be permuted.";

QuarkMass::usage= "QuarkMass is an option of Amplitude.";

SpinPolarizationSum::usage=
"SpinPolarizationSum is an option for SquareAmplitude and \
FermionSpinSum. The set (pure) function acts on the usual spin sum.";

SUNIndexNames::usage =
"SUNIndexNames is an option for FCFAConvert, FCCanonicalizeDummyIndices \
and other functions. It renames the generic dummy SU(N) indices in the \
adjoint representation to the indices in the supplied list.";

SUNFIndexNames::usage =
"SUNFIndexNames is an option for FCFAConvert, FCCanonicalizeDummyIndices \
and other functions. It renames the generic dummy SU(N) indices in the \
fundamental representation to the indices in the supplied list.";

SUNNToCACF::usage=
"SUNNToCACF is an option of SUNSimplify. If set to True, the Casimir \
operator eigenvalues CA (=N) and CF (=(N^2-1)/(2 N)) are introduced.";

TraceOfOne::usage =
"TraceOfOne is an option for Tr and DiracTrace. \
Its setting determines the value of the unit trace.";

VirtualBoson::usage =
"VirtualBoson is an option for PolarizationSum and DoPolarizationSums. \
If set to True, FeynCalc will not complain when you apply the gauge \
trick (i.e. replace the polarization sum by - MT[mu,nu]) for a particle \
that is not massless. This is usueful when computing processes \
that involve a virtual photon as an external state."

West::usage =
"West is an option for DiracTrace, TR and other functions that deal \
with traces of Dirac matrices. It applies only to the computation of \
D-dimensional chiral traces (i.e. those that involve one gamma5) in the \
Breitenlohner-Maison-t'Hooft-Veltman (BMHV) scheme. If set to True, such \
traces will be computed according to formula  (A.5) from \
Comp. Phys. Comm 77 (1993) 286-298, which is also known as West's formula.";

WriteOut::usage =
"WriteOut is an option for OneLoop and SquareAmplitude. \
If set to True, the result of OneLoop will be written to a \
file called \"name.res\", where name is the first argument of OneLoop.";

WriteOutPaVe::usage=
"WriteOutPaVe is an option for PaVeReduce and OneLoopSum. \
If set to a string, the results of all Passarino-Veltman PaVe's are stored in \
files with names generated from this string and the arguments of PaVe.";

ZeroMomentumInsertion::usage=
"ZeroMomentumInsertion is an option of FeynRule, Twist2GluonOperator and \
Twist2QuarkOperator.";

(* ------------------------------------------------------------------------ *)

Begin["`Package`"]

End[]

Begin["`CoreOptions`Private`"]

FCPrint[1,"SharedOptions.m loaded."];
End[]
