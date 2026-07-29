import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean

structure CompartmentModelPackage where
  numCompartments : Nat
  drugMassBalanceEquations : Prop
  compartmentVolumeConstants : Prop
  clearanceKinetics : Prop
  absorptionRateFunction : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  drugMassBalanceEquationsClosed : C.drugMassBalanceEquations
  compartmentVolumeConstantsClosed : C.compartmentVolumeConstants
  clearanceKineticsClosed : C.clearanceKinetics
  absorptionRateFunctionClosed : C.absorptionRateFunction

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.drugMassBalanceEquations ∧ C.compartmentVolumeConstants ∧
  C.clearanceKinetics ∧ C.absorptionRateFunction

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage) (E : CompartmentModelEvidence C) :
    CompartmentModelClosed C := by
  exact And.intro E.drugMassBalanceEquationsClosed
    (And.intro E.compartmentVolumeConstantsClosed
      (And.intro E.clearanceKineticsClosed E.absorptionRateFunctionClosed))

end ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean
end HautevilleHouse