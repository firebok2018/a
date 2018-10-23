private void btnEncritpar_Click(object sender, EventArgs e)
        {
            MemoryStream ms = new MemoryStream();
            StreamWriter code = new StreamWriter(ms);
            code.Write(txtTExt.Text);
            code.Flush();

            SHA1CryptoServiceProvider sha = new SHA1CryptoServiceProvider();
            byte[] datos = sha.ComputeHash(ms.ToArray());
            txtEncript.Text = "";
            foreach(byte bt in datos)
            {
                txtEncript.Text += bt.ToString();
            }
        }
        
        
    DESCryptoServiceProvider servicio = new DESCryptoServiceProvider();
        byte[] key = new byte[] { 70, 71, 72, 73, 74, 75, 76, 77 };
        byte[] iv = new byte[] { 60, 61, 62, 63, 64, 65, 66, 67 };
        public Form2()
        {
            InitializeComponent();
        }

        private void btnEncriptat_Click(object sender, EventArgs e)
        {
            SaveFileDialog sv = new SaveFileDialog();
            sv.Filter = "Archivo Cifrado|*.cyt";
            if (sv.ShowDialog() == DialogResult.OK)
            {
                MemoryStream ms = new MemoryStream();
                StreamWriter escritor = new StreamWriter(ms);
                escritor.Write(txtS.Text);
                escritor.Flush();

                FileStream file = new FileStream(sv.FileName, FileMode.Create);
                CryptoStream crypto = new CryptoStream(file,servicio.CreateEncryptor(key,iv), CryptoStreamMode.Write);
                crypto.Write(ms.ToArray(), 0, ms.ToArray().Length);
                crypto.Close();
                file.Close();
            }

        }

        private void brnDesencriptar_Click(object sender, EventArgs e)
        {
            OpenFileDialog op = new OpenFileDialog();
            op.Filter = "Archivo de Encriptacion|*.cyt";
            if (op.ShowDialog()==DialogResult.OK)
            {
                FileStream file = new FileStream(op.FileName, FileMode.Open);
                CryptoStream decryt = new CryptoStream(file, servicio.CreateDecryptor(key, iv), CryptoStreamMode.Read);
                byte[] datos = new byte[4096];
                decryt.Read(datos, 0, datos.Length);

                MemoryStream ms = new MemoryStream();
                ms.Write(datos, 0, datos.Length);
                ms.Position = 0;
                txtS.Text = new StreamReader(ms).ReadToEnd();

            }
        }
        
        private void btnSerializar_Click(object sender, EventArgs e)
        {
            SaveFileDialog sv = new SaveFileDialog();
            sv.Filter = "Archivo Binario|/.bin";

            if (sv.ShowDialog()==DialogResult.OK)
            {
                FileStream f = new FileStream(sv.FileName, FileMode.Create);
                BinaryFormatter bin = new BinaryFormatter();
                bin.Serialize(f,txtBinaria.Text);
                f.Close();
            }
        }

        private void btnDezealixzar_Click(object sender, EventArgs e)
        {
            OpenFileDialog op = new OpenFileDialog();
            op.Filter = "Archivo Binario|*.bin";
            if (op.ShowDialog()==DialogResult.OK)
            {
                FileStream f = new FileStream(op.FileName, FileMode.Open);
                BinaryFormatter bin =new BinaryFormatter();
                txtBinaria.Text = bin.Deserialize(f).ToString();
                f.Close();
            }
        }
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            Alumno alumn = new Alumno();
            alumn.dni = txtdni.Text;
            alumn.nombre = txtnombre.Text;
            alumn.apellido = txtApellido.Text;
            alumn.telefono = txttlefono.Text;
            alumn.fechanc = dtpFechaNac.Value;

            al.lisAlu.Add(alumn);

            dgvAlumnos.DataSource = null;
            dgvAlumnos.DataSource = al.lisAlu;
        }
txtdni.Text = dgvAlumnos.CurrentRow.Cells[0].Value.ToString();
private void button1_Click(object sender, EventArgs e)
        {
            libro reg = new libro();

            reg.codigo = int.Parse(txtcodigo.Text);
            reg.autor = txtAutor.Text;
            reg.año = int.Parse(txtanio.Text);
            reg.materia = cboMateria.Text;
            reg.titulo = txttitulow.Text;

            lib.Add(reg);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            dgLibros.DataSource = null;
            dgLibros.DataSource = lib;
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            libro l = lib.Find(x => x.codigo == int.Parse(txtcodigo.Text));

            if (lib == null)
            {
                MessageBox.Show("Codigo no exixtente");
            }
            else
            {
                lib.Remove(l);
            }
                

           
        }
