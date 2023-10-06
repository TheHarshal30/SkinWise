const mongoose = require('mongoose')

const reportSchema = mongoose.Schema(
    {
        user_id: {
            type: String,
            required: true,
        },

        predL : {
            type: String,
            required: true,
        }, 

        date: {
            type: String,
            required: true,
        },

        cure : {
            type : String,
            required : true
        },

        Acne_Rosacea: {
            type: String,
            default: "0%",
        },
        Actinic_Keratosis_Basal_Cell_Carcinoma: {
            type: String,
            default: "0%",
        },
        Atopic_Dermatitis: {
            type: String,
            default: "0%",
        },
        Bullous_Disease: {
            type: String,
            default: "0%",
        },
        Cellulitis_Impetigo_Bacterial_Infections: {
            type: String,
            default: "0%",
        },
        Eczema: {
            type: String,
            default: "0%",
        },
        Exanthems_Drug_Eruptions: {
            type: String,
            default: "0%",
        },
        Hair_Loss_Alopecia: {
            type: String,
            default: "0%",
        },
        Herpes_HPV: {
            type: String,
            default: "0%",
        },
        Disorders_of_Pigmentation: {
            type: String,
            default: "0%",
        },
        Lupus: {
            type: String,
            default: "0%",
        },
        Melanoma_Skin_Cancer: {
            type: String,
            default: "0%",
        },
        Nail_Fungus: {
            type: String,
            default: "0%",
        },
        Poison_Ivy: {
            type: String,
            default: "0%",
        },
        Psoriasis_Lichen_Planus: {
            type: String,
            default: "0%", 
        },
        Scabies_Lyme: {
            type: String,
            default: "0%",
        },
        Seborrheic_Keratoses: {
            type: String,
            default: "0%",
        },
        Systemic_Disease: {
            type: String,
            default: "0%",
        },
        Tinea_Ringworm_Fungal_Infections: {
            type: String,
            default: "0%",
        },
        Urticaria_Hives: {
            type: String,
            default: "0%",
        },
        Vascular_Tumors: {
            type: String,
            default: "0%",
        },
        Vasculitis: {
            type: String,
            default: "0%",
        },
        Warts_Molluscum: {
            type: String,
            default: "0%",
        },
    },
    {
        timestamps: true,
    }
);

module.exports = mongoose.model('Report', reportSchema);



const report = mongoose.model('Report', reportSchema);

module.exports = report;