bash /content/JointSDIC-Improvement_experimentation/run_jointBERT-CRF_XLM-Rencoder.sh
export lr=3e-5
export c=0.45
export s=10
echo "${lr}"
export MODEL_DIR=JointBERT-CRF_XLM-Rencoder
export MODEL_DIR=$MODEL_DIR"/"$lr"/"$c"/"$s
echo "${MODEL_DIR}"
python3 /content/JointSDIC-Improvement_experimentation/main.py --token_level syllable-level \
                  --model_type xlmr \
                  --model_dir $MODEL_DIR \
                  --data_dir /content/JointSDIC-Improvement_experimentation/PhoATIS \
                  --seed $s \
                  --do_train \
                  --do_eval \
                  --save_steps 140 \
                  --logging_steps 140 \
                  --num_train_epochs 5 \
                  --tuning_metric mean_intent_slot \
                  --use_crf \
                  --gpu_id 0 \
                  --embedding_type soft \
                  --intent_loss_coef $c \
                  --pretrained \
                  --pretrained_path JointBERT-CRF_XLM-Rencoder/4e-5/0.45/10 \
                  --learning_rate $lr
