-- universal_sentence_encoder(input) - Embedding model that encodes text into high dimensional vectors that can be used for text classification, semantic similarity, clustering and other natural language tasks.
-- @model_download_url(https://huggingface.co/HCL-Software/actian_universal_sentence_encoder/resolve/1.0.0/actian_universal_sentence_encoder.zip)
CREATE MODEL universal_sentence_encoder(
    INPUT SET OF(input varchar(32000))
) RESULT ROW (embeddings VECTOR(512, FLOAT4))
AS TYPE tensorflow PATH = '[model_path]', MEMORY = 2000000000; \g
