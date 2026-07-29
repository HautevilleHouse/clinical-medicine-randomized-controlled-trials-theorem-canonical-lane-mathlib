import ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean

structure TheoremStatement where
  trialDesign : String
  treatmentEffectEstimated : Prop
  confidenceIntervalIncluded : Prop
  pValueReported : Prop

def rtc_theorem_statement (T : TheoremStatement) : Prop :=
  T.treatmentEffectEstimated ∧ T.confidenceIntervalIncluded ∧ T.pValueReported

theorem theorem_statement_holds (T : TheoremStatement) (h : rtc_theorem_statement T) : Prop :=
  h

end ClinicalMedicineRandomizedControlledTrialsTheoremCanonicalLaneLean
end HautevilleHouse
