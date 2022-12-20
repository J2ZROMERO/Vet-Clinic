CREATE TABLE "patients"(
    "id" INTEGER NULL,
    "name" VARCHAR(255) NULL,
    "date_of_birth" DATE NULL
);
ALTER TABLE
    "patients" ADD PRIMARY KEY("id");
CREATE TABLE "invoices"(
    "id" INTEGER NULL,
    "total_amount" DECIMAL(8, 2) NULL,
    "generated_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "payed_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "medical_history_id" INTEGER NOT NULL
);
ALTER TABLE
    "invoices" ADD PRIMARY KEY("id");
CREATE TABLE "treatments"(
    "id" INTEGER NULL,
    "type" VARCHAR(255) NULL,
    "name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "treatments" ADD PRIMARY KEY("id");
CREATE TABLE "medical_histories"(
    "id" INTEGER NULL,
    "admitted_at" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "patient_id" INTEGER NULL,
    "status" VARCHAR(255) NULL
);
ALTER TABLE
    "medical_histories" ADD PRIMARY KEY("id");
CREATE TABLE "invoice_items"(
    "id" INTEGER NULL,
    "unit_price" DECIMAL(8, 2) NULL,
    "quantity" INTEGER NULL,
    "total_price" DECIMAL(8, 2) NOT NULL,
    "invoice_id" INTEGER NOT NULL,
    "treatment_id" INTEGER NOT NULL
);
ALTER TABLE
    "invoice_items" ADD PRIMARY KEY("id");
CREATE TABLE "medical_treatments"(
    "fk_medical_histories" INTEGER NOT NULL,
    "fk_treatments" INTEGER NOT NULL
);
ALTER TABLE
    "medical_histories" ADD CONSTRAINT "medical_histories_patient_id_foreign" FOREIGN KEY("patient_id") REFERENCES "patients"("id");
ALTER TABLE
    "invoice_items" ADD CONSTRAINT "invoice_items_invoice_id_foreign" FOREIGN KEY("invoice_id") REFERENCES "invoices"("id");
ALTER TABLE
    "invoice_items" ADD CONSTRAINT "invoice_items_treatment_id_foreign" FOREIGN KEY("treatment_id") REFERENCES "treatments"("id");
ALTER TABLE
    "medical_treatments" ADD CONSTRAINT "medical_treatments_fk_treatments_foreign" FOREIGN KEY("fk_treatments") REFERENCES "treatments"("id");
ALTER TABLE
    "invoices" ADD CONSTRAINT "invoices_medical_history_id_foreign" FOREIGN KEY("medical_history_id") REFERENCES "medical_histories"("id");
ALTER TABLE
    "medical_treatments" ADD CONSTRAINT "medical_treatments_fk_medical_histories_foreign" FOREIGN KEY("fk_medical_histories") REFERENCES "medical_histories"("id");

CREATE INDEX patient_index ON medical_histories(patient_id);
CREATE INDEX invoice_index ON invoice_items(invoice_id);
CREATE INDEX invoice_index ON invoice_items(treatment_id);
CREATE INDEX treatments_index ON medical_treatments(fk_treatments);
CREATE INDEX invoices_index ON invoices(medical_history_id);
CREATE INDEX medical_index ON medical_treatments(fk_medical_histories);

