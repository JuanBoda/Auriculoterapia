namespace primeraApp
{
    partial class Pantalla_Inicial
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnNuevoPaciente = new System.Windows.Forms.Button();
            this.btnCerraPantaInicio = new System.Windows.Forms.Button();
            this.txtDniInicio = new System.Windows.Forms.TextBox();
            this.lblDniInicio = new System.Windows.Forms.Label();
            this.btnBuscarInicio = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnNuevoPaciente
            // 
            this.btnNuevoPaciente.Anchor = System.Windows.Forms.AnchorStyles.Top;
            this.btnNuevoPaciente.BackColor = System.Drawing.Color.Transparent;
            this.btnNuevoPaciente.Location = new System.Drawing.Point(118, 140);
            this.btnNuevoPaciente.Name = "btnNuevoPaciente";
            this.btnNuevoPaciente.Size = new System.Drawing.Size(172, 37);
            this.btnNuevoPaciente.TabIndex = 1;
            this.btnNuevoPaciente.Text = "Nuevo";
            this.btnNuevoPaciente.UseVisualStyleBackColor = false;
            this.btnNuevoPaciente.Click += new System.EventHandler(this.btnNuevoPaciente_Click);
            // 
            // btnCerraPantaInicio
            // 
            this.btnCerraPantaInicio.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnCerraPantaInicio.BackColor = System.Drawing.SystemColors.ControlLight;
            this.btnCerraPantaInicio.Location = new System.Drawing.Point(215, 256);
            this.btnCerraPantaInicio.Name = "btnCerraPantaInicio";
            this.btnCerraPantaInicio.Size = new System.Drawing.Size(75, 23);
            this.btnCerraPantaInicio.TabIndex = 2;
            this.btnCerraPantaInicio.Text = "Cerrar";
            this.btnCerraPantaInicio.UseVisualStyleBackColor = false;
            this.btnCerraPantaInicio.Click += new System.EventHandler(this.btnCerraPantaInicio_Click);
            // 
            // txtDniInicio
            // 
            this.txtDniInicio.Location = new System.Drawing.Point(118, 105);
            this.txtDniInicio.Name = "txtDniInicio";
            this.txtDniInicio.Size = new System.Drawing.Size(172, 20);
            this.txtDniInicio.TabIndex = 3;
            // 
            // lblDniInicio
            // 
            this.lblDniInicio.AutoSize = true;
            this.lblDniInicio.Font = new System.Drawing.Font("Microsoft YaHei", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDniInicio.ForeColor = System.Drawing.SystemColors.Control;
            this.lblDniInicio.Location = new System.Drawing.Point(114, 83);
            this.lblDniInicio.Name = "lblDniInicio";
            this.lblDniInicio.Size = new System.Drawing.Size(84, 19);
            this.lblDniInicio.TabIndex = 4;
            this.lblDniInicio.Text = "Ingresar Dni";
            // 
            // btnBuscarInicio
            // 
            this.btnBuscarInicio.Location = new System.Drawing.Point(297, 256);
            this.btnBuscarInicio.Name = "btnBuscarInicio";
            this.btnBuscarInicio.Size = new System.Drawing.Size(75, 23);
            this.btnBuscarInicio.TabIndex = 5;
            this.btnBuscarInicio.Text = "Buscar";
            this.btnBuscarInicio.UseVisualStyleBackColor = true;
            this.btnBuscarInicio.Click += new System.EventHandler(this.btnBuscarInicio_Click);
            // 
            // Pantalla_Inicial
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.WindowFrame;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(384, 291);
            this.Controls.Add(this.btnBuscarInicio);
            this.Controls.Add(this.lblDniInicio);
            this.Controls.Add(this.txtDniInicio);
            this.Controls.Add(this.btnCerraPantaInicio);
            this.Controls.Add(this.btnNuevoPaciente);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximumSize = new System.Drawing.Size(500, 330);
            this.MinimumSize = new System.Drawing.Size(400, 330);
            this.Name = "Pantalla_Inicial";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Pantlla Inicial";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Button btnNuevoPaciente;
        private System.Windows.Forms.Button btnCerraPantaInicio;
        private System.Windows.Forms.TextBox txtDniInicio;
        private System.Windows.Forms.Label lblDniInicio;
        private System.Windows.Forms.Button btnBuscarInicio;
    }
}