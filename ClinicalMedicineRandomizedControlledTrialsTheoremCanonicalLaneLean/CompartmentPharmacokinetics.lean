import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean

structure CompartmentModel where
  compartments : Nat
  transferRates : Matrix (Fin compartments) (Fin compartments) ℝ
  initialConcentration : Fin compartments → ℝ
  concentrationFunction : ℝ → Fin compartments → ℝ
  modelWellDefined : Prop

structure CompartmentPharmacokineticsEvidence (C : CompartmentModel) where
  modelWellDefinedClosed : C.modelWellDefined

def CompartmentPharmacokineticsClosed (C : CompartmentModel) : Prop :=
  C.modelWellDefined

theorem compartment_pharmacokinetics_closed_from_evidence
    (C : CompartmentModel) (E : CompartmentPharmacokineticsEvidence C) :
    CompartmentPharmacokineticsClosed C :=
  E.modelWellDefinedClosed

end ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean
end HautevilleHouse