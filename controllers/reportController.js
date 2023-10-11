const Report = require('../Models/reportModel')
const asyncHandler = require('express-async-handler')


const getreports = asyncHandler(async(req, res) =>{
    try {
        const {uid} = req.params;
        const product = await Report.find({user_id : uid});
        res.status(200).json(product);
    } catch (error) {
        res.status(500);
        throw new Error(error.message);
    }
})

const createreport = asyncHandler(async(req, res) => {
        const { 
            user_id,
            image,
            predL,
            date,
            cure ,
            Acne_Rosacea,
            Actinic_Keratosis_Basal_Cell_Carcinoma,
            Atopic_Dermatitis,
            Bullous_Disease,
            Cellulitis_Impetigo_Bacterial_Infections,
            Eczema,
            Exanthems_Drug_Eruptions,
            Hair_Loss_Alopecia,
            Herpes_HPV,
            Disorders_of_Pigmentation,
            Lupus,
            Melanoma_Skin_Cancer,
            Nail_Fungus,
            Poison_Ivy,
            Psoriasis_Lichen_Planus,
            Scabies_Lyme,
            Seborrheic_Keratoses,
            Systemic_Disease,
            Tinea_Ringworm_Fungal_Infections,
            Urticaria_Hives,
            Vascular_Tumors,
            Vasculitis,
            Warts_Molluscum } = req.body;
    
        const product = await Report.create({
            user_id,
            image,
            predL,
        date,
        cure ,
            Acne_Rosacea,
            Actinic_Keratosis_Basal_Cell_Carcinoma,
            Atopic_Dermatitis,
            Bullous_Disease,
            Cellulitis_Impetigo_Bacterial_Infections,
            Eczema,
            Exanthems_Drug_Eruptions,
            Hair_Loss_Alopecia,
            Herpes_HPV,
            Disorders_of_Pigmentation,
            Lupus,
            Melanoma_Skin_Cancer,
            Nail_Fungus,
            Poison_Ivy,
            Psoriasis_Lichen_Planus,
            Scabies_Lyme,
            Seborrheic_Keratoses,
            Systemic_Disease,
            Tinea_Ringworm_Fungal_Infections,
            Urticaria_Hives,
            Vascular_Tumors,
            Vasculitis,
            Warts_Molluscum
        }); 
        res.status(200).json(product);
})

module.exports = {
 getreports,
    createreport,
}