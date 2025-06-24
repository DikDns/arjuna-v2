class_name MateriController extends Control

@onready var bg = $bgtexture
@onready var card1 = $PanelContainer2/HBoxContainer/bgcard1
@onready var card2 = $PanelContainer2/HBoxContainer/bgcard2
@onready var card3 = $PanelContainer2/HBoxContainer/bgcard3

var materi = {
	"gempa": {
		"name": "Gempa",
		"bg": "res://assets/materi/gempa/background.png",
		"ciri-ciri": {
			"bg": "res://assets/materi/gempa/ciri-ciri-bg.png",
			"contents": [
				{
					"id": 1,
					"title": "Medan Elektromagnetik Bermasalah",
					"description": "Gempa bumi melepaskan energi dalam bentuk gelombang elektromagnetik yang luar biasa kuat. Gelombang ini bisa mengganggu sinyal elektronik, seperti TV, radio, atau sinyal HP, meski tidak terasa langsung oleh manusia. Contohnya sinyal HP tiba-tiba hilang atau terganggu tanpa alasan jelas, meskipun biasanya lancar.",
					"image": "res://assets/materi/gempa/ciri-ciri/medan elektromagnetis bermasalah.png"
				},
				{
					"id": 2,
					"title": "Tingkah Laku Hewan Aneh",
					"description": "Hewan memiliki insting alami yang lebih peka terhadap getaran atau perubahan elektromagnetik di bumi. Mereka sering bertingkah tidak biasa sebelum gempa, seperti: Anjing menggonggong tanpa sebab, Kucing melompat ketakutan, Burung beterbangan secara tak beraturan, Ikan meloncat-loncat ke permukaan. Di banyak kejadian gempa, warga mengamati hewan peliharaan mereka jadi gelisah beberapa menit sebelum gempa terjadi.",
					"image": "res://assets/materi/gempa/ciri-ciri/hewan bertingkah tidak wajar.png"
				},
				{
					"id": 3,
					"title": "Awan Seperti Berbentuk Berdiri",
					"description": "Awan yang tampak tegak lurus ke atas atau berbentuk aneh bisa muncul karena adanya aktivitas elektromagnetik kuat dari dalam bumi sebelum gempa. Energi yang dilepaskan dari tekanan lempeng bumi dapat memengaruhi atmosfer dan menciptakan formasi awan yang tidak biasa. Contohnya awan seperti 'pilar cahaya' atau garis lurus ke atas di langit.",
					"image": "res://assets/materi/gempa/ciri-ciri/awan seperti berbentuk berdiri.png"
				},
				{
					"id": 4,
					"title": "Getaran Tanah Tiba-tiba",
					"description": "Getaran tanah yang terjadi secara tiba-tiba merupakan ciri utama terjadinya gempa bumi. Getaran ini bisa ringan hingga sangat kuat tergantung dari kekuatan gempa dan jarak dari pusat gempa.",
					"image": "res://assets/materi/gempa/ciri-ciri/getaran tanah tiba tiba.png"
				}
			]
		},
		"penyebab": {
			"bg": "res://assets/materi/gempa/penyebab-bg.png",
			"contents": [
				{
					"id": 1,
					"title": "Peledakan Gunung Api",
					"description": "Ketika gunung berapi meletus, tekanan besar dari dalam bumi dilepaskan dalam bentuk letusan dan getaran hebat. Ledakan ini dapat mengguncang wilayah sekitarnya dan memicu terjadinya gempa vulkanik. Contohnya letusan Gunung Sinabung atau Gunung Merapi sering diikuti oleh gempa lokal di area sekitar gunung.",
					"image": "res://assets/materi/gempa/penyebab/peledakan gunung api.png"
				},
				{
					"id": 2,
					"title": "Aktivitas Vulkanik",
					"description": "Aktivitas magma yang bergerak di dalam perut bumi menuju permukaan menyebabkan tekanan yang bisa menimbulkan gempa, meskipun belum sampai meletus. Ini biasanya berupa gempa kecil (mikroseismik) sebagai peringatan awal aktivitas vulkanik. Sebelum gunung meletus, sering terjadi serangkaian gempa kecil yang menandakan tekanan magma sedang meningkat.",
					"image": "res://assets/materi/gempa/penyebab/aktivitas vulkanik.png"
				},
				{
					"id": 3,
					"title": "Tumbukan Benda Langit",
					"description": "Meteor atau asteroid yang jatuh ke bumi dengan kecepatan tinggi bisa melepaskan energi besar saat menghantam permukaan bumi. Tumbukan ini dapat menghasilkan getaran kuat seperti gempa. Walau jarang terjadi, peristiwa seperti di Chelyabinsk, Rusia (2013) menunjukkan bahwa benda langit bisa menimbulkan dampak signifikan jika ukurannya besar dan kecepatannya tinggi.",
					"image": "res://assets/materi/gempa/penyebab/tumbukan benda langit.png"
				},
				{
					"id": 4,
					"title": "Pergerakan Lempeng",
					"description": "Permukaan bumi tersusun atas beberapa lempeng tektonik. Ketika dua lempeng saling bergeser, bertumbukan, atau menjauh satu sama lain, terjadi akumulasi energi yang pada akhirnya dilepaskan dalam bentuk gempa bumi. Ini adalah penyebab gempa tektonik, yang paling umum terjadi. Gempa besar di Indonesia seperti di Aceh (2004) dan Palu (2018) disebabkan oleh aktivitas lempeng Indo-Australia dan Eurasia.",
					"image": "res://assets/materi/gempa/penyebab/pergerakan lempeng.png"
				}
			]
		},
		"dampak": {
			"bg": "res://assets/materi/gempa/dampak-bg.png",
			"contents": [
				{
					"id": 1,
					"title": "Kerusakan Lingkungan",
					"description": "Gempa bumi dapat menyebabkan kerusakan serius pada permukaan bumi seperti: Jalan raya menjadi retak atau bergelombang, Jembatan patah atau roboh, Bangunan mengalami keretakan hingga runtuh total. Gempa yang kuat bisa mengubah bentuk tanah, memunculkan patahan, bahkan menggeser posisi geografis suatu wilayah.",
					"image": "res://assets/materi/gempa/dampak/kerusakan lingkungan.png"
				},
				{
					"id": 2,
					"title": "Kerusakan Fasilitas",
					"description": "Dalam waktu singkat, gempa bisa merusak berbagai fasilitas penting, seperti: Rumah tinggal dan perabot di dalamnya, Sekolah, rumah sakit, kantor, tempat ibadah, Sarana umum seperti listrik, air, dan telekomunikasi. Hal ini sangat mengganggu kehidupan sehari-hari masyarakat dan dapat menyebabkan kerugian besar.",
					"image": "res://assets/materi/gempa/dampak/kerusakan fasilitas.png"
				},
				{
					"id": 3,
					"title": "Menimbulkan Longsor",
					"description": "Gempa yang kuat dapat memicu pergeseran tanah di lereng gunung, bukit, atau dataran tinggi sehingga menyebabkan tanah longsor. Longsor ini sangat berbahaya terutama di daerah yang rawan atau memiliki struktur tanah yang labil. Tanah longsor bisa menimbun rumah, jalan, bahkan menutup akses evakuasi dan pertolongan.",
					"image": "res://assets/materi/gempa/dampak/menimbulkan longsor.png"
				},
				{
					"id": 4,
					"title": "Munculnya Tsunami",
					"description": "Gempa bawah laut yang besar dapat memicu pergeseran dasar laut secara tiba-tiba, menciptakan gelombang besar yang disebut tsunami. Tsunami bisa mencapai daratan dengan kecepatan tinggi dan merusak apapun yang dilewatinya. Tsunami Aceh 2004 adalah dampak dari gempa bawah laut yang sangat besar.",
					"image": "res://assets/materi/gempa/dampak/munculnya tsunami.png"
				},
				{
					"id": 5,
					"title": "Menimbulkan Korban Jiwa",
					"description": "Gempa dapat menyebabkan banyak korban karena: Tertimpa bangunan runtuh, Tertimbun longsor, Terbawa arus tsunami, Terluka karena reruntuhan atau benda jatuh. Selain korban fisik, gempa juga menimbulkan trauma psikologis yang cukup berat, terutama bagi anak-anak dan lansia.",
					"image": "res://assets/materi/gempa/dampak/menimbulkan korban jiwa.png"
				}
			]
		},
	},
	"longsor": {
		"name": "Longsor",
		"bg": "res://assets/materi/longsor/background.png",
		"ciri-ciri": {
			"bg": "res://assets/materi/longsor/ciri-ciri-bg.png",
			"contents": [
				{
					"id": 1,
					"title": "Mata Air Baru Muncul Tiba-tiba",
					"description": "Saat hujan deras, air yang seharusnya meresap ke dalam tanah justru mengalir di permukaan dan bisa menembus lapisan tanah yang tidak stabil. Ini bisa memicu munculnya mata air baru secara mendadak di lereng bukit atau tebing. Tanda bahayanya adalah munculnya air dari celah tanah atau dinding lereng yang sebelumnya kering.",
					"image": "res://assets/materi/longsor/ciri-ciri/mata air baru muncul tiba tiba.png"
				},
				{
					"id": 2,
					"title": "Halaman Rumah Ambles",
					"description": "Permukaan tanah tiba-tiba turun atau tenggelam, biasanya di area pekarangan rumah, jalan, atau halaman. Ini terjadi karena tanah di bawah permukaan bergerak atau kehilangan kekuatan menopang beban di atasnya. Tanda bahayanya adalah retakan di lantai rumah, tembok miring, atau jalan tiba-tiba bergelombang.",
					"image": "res://assets/materi/longsor/ciri-ciri/halaman rumah ambles.jpg"
				},
				{
					"id": 3,
					"title": "Adanya Retakan",
					"description": "Setelah hujan, tanah di lereng tebing yang jenuh air bisa mulai merekah. Retakan yang sejajar arah lereng merupakan pertanda awal tanah mulai bergeser. Tanda bahayanya adalah retakan yang makin lama makin lebar, terutama jika muncul di sepanjang lereng atau tanggul.",
					"image": "res://assets/materi/longsor/ciri-ciri/adanya retakan.jpg"
				},
				{
					"id": 4,
					"title": "Banyak Kerikil Berjatuhan",
					"description": "Tebing atau lereng yang rapuh dan jenuh air sering mulai menggugurkan kerikil atau batu kecil. Ini adalah tanda awal bahwa struktur tanah sedang melemah. Tanda bahayanya adalah bunyi kerikil jatuh, atau kerikil terlihat bergulir turun secara terus menerus.",
					"image": "res://assets/materi/longsor/ciri-ciri/banyak kerikil berjatuhan.jpg"
				},
				{
					"id": 5,
					"title": "Pohon/Tiang Listrik Agak Miring",
					"description": "Jika pohon, tiang listrik, atau bangunan tiba-tiba terlihat miring, kemungkinan besar tanah di bawahnya sedang bergerak. Ini sering terjadi sebelum longsor besar. Tanda bahayanya adalah perubahan posisi yang cepat, akar pohon terlihat terangkat di satu sisi, atau tiang listrik mulai melengkung.",
					"image": "res://assets/materi/longsor/ciri-ciri/pohon atau tiang listrik agak miring.png"
				}
			]
		},
		"penyebab": {
			"bg": "res://assets/materi/longsor/penyebab-bg.png",
			"contents": [
				{
					"id": 1,
					"title": "Penebangan Liar",
					"description": "Tumbuhan berfungsi sebagai penahan tanah, terutama akar pohon yang menjalar ke dalam tanah dan menahan struktur tanah agar tetap stabil. Jika pohon-pohon ditebang secara sembarangan tanpa reboisasi, maka tanah akan mudah terkena erosi (pengikisan) oleh air hujan, sehingga lereng menjadi tidak stabil dan rentan longsor. Contohnya lereng bukit yang gundul atau hutan yang dibabat habis lebih cepat mengalami tanah longsor setelah hujan deras.",
					"image": "res://assets/materi/longsor/penyebab/penebangan liar.jpg"
				},
				{
					"id": 2,
					"title": "Beban Berlebihan Suatu Area",
					"description": "Jika suatu area memiliki beban berlebih (seperti pembangunan gedung bertingkat, penumpukan material, atau kendaraan berat di area miring), maka tekanan pada tanah menjadi sangat tinggi. Hal ini bisa memicu retakan dan pergeseran tanah, yang akhirnya menyebabkan longsor. Contohnya rumah atau bangunan besar yang dibangun di atas lereng curam.",
					"image": "res://assets/materi/longsor/penyebab/beban berlebihan di suatu area.jpg"
				},
				{
					"id": 3,
					"title": "Curah Hujan Tinggi",
					"description": "Hujan deras dalam waktu lama menyebabkan tanah menjadi jenuh air. Ketika air meresap terus menerus, berat tanah meningkat dan daya ikat antar partikel tanah menurun. Akibatnya, tanah mulai meluncur turun, terutama di daerah lereng atau miring. Contohnya setelah hujan deras beberapa hari, tebing atau dataran tinggi bisa longsor karena tanah tidak mampu lagi menahan beban air.",
					"image": "res://assets/materi/longsor/penyebab/curah hujan tinggi.jpg"
				},
				{
					"id": 4,
					"title": "Gempa Bumi",
					"description": "Guncangan dari gempa menyebabkan tekanan mendadak pada tanah dan batuan. Jika tanah sudah tidak stabil (misalnya karena jenuh air atau punya bidang lemah), maka getaran ini bisa memicu tanah untuk bergeser atau runtuh. Contohnya di daerah pegunungan atau bukit, longsor sering terjadi setelah gempa walaupun tidak ada hujan.",
					"image": "res://assets/materi/longsor/penyebab/gempa bumi.jpg"
				},
				{
					"id": 5,
					"title": "Gunung Meletus",
					"description": "Letusan gunung api mengeluarkan getaran besar dan material vulkanik seperti abu, pasir, dan batu. Material ini bisa menumpuk di lereng dan ketika hujan datang, akan terbentuk aliran material longsor (lahar dingin). Selain itu, getaran dari letusan juga bisa memicu retakan tanah. Contohnya longsor lahar dingin sering terjadi setelah letusan gunung seperti Merapi atau Semeru saat musim hujan.",
					"image": "res://assets/materi/longsor/penyebab/gunung meletus.jpg"
				}
			]
		},
		"dampak": {
			"bg": "res://assets/materi/longsor/dampak-bg.png",
			"contents": [
				{
					"id": 1,
					"title": "Kerugian Secara Ekonomi",
					"description": "Tanah longsor sering menyebabkan akses jalan terputus, lahan pertanian rusak, serta bangunan dan infrastruktur hancur. Akibatnya, aktivitas ekonomi seperti jual beli, pertanian, dan pekerjaan lainnya menjadi terhambat atau bahkan berhenti total. Contohnya petani tidak bisa menjual hasil panen karena jalan tertimbun longsor, atau toko tutup karena bangunan rusak.",
					"image": "res://assets/materi/longsor/dampak/kerugian secara ekonomi.jpg"
				},
				{
					"id": 2,
					"title": "Kerusakan Lingkungan",
					"description": "Longsor bisa menumbangkan pepohonan, merusak habitat hewan, menghancurkan tanah pertanian, serta mencemari lahan dan air. Kerusakan ini bisa terjadi hanya dalam hitungan menit dan butuh waktu lama untuk pulih. Contohnya hutan gundul atau kebun warga tertimbun tanah dan batu, merusak keseimbangan ekosistem.",
					"image": "res://assets/materi/longsor/dampak/kerusakan lingkungan.jpg"
				},
				{
					"id": 3,
					"title": "Pencemaran Sumber Air",
					"description": "Material longsor seperti lumpur, sampah, dan batu-batuan bisa masuk ke sungai, mata air, dan danau. Hal ini menyebabkan kualitas air menurun dan berbahaya bagi kesehatan manusia dan makhluk hidup lain. Contohnya air sungai menjadi keruh dan tercemar lumpur sehingga tidak bisa digunakan untuk kebutuhan sehari-hari.",
					"image": "res://assets/materi/longsor/dampak/pencemaran sumber air.jpg"
				},
				{
					"id": 4,
					"title": "Kehilangan Tempat Tinggal",
					"description": "Rumah-rumah yang berada di daerah lereng atau tebing sangat rawan tertimbun longsor. Jika terjadi longsor besar, seluruh bangunan bisa hancur dan penghuninya kehilangan tempat tinggal. Contohnya kampung di bawah bukit bisa rata dengan tanah akibat tanah dan batu yang meluncur dari atas.",
					"image": "res://assets/materi/longsor/dampak/kehilangan tempat tinggal.jpg"
				},
				{
					"id": 5,
					"title": "Menimbulkan Korban Jiwa",
					"description": "Longsor bisa terjadi secara tiba-tiba, terutama saat hujan deras atau gempa. Tanah yang runtuh dalam jumlah besar dapat menimbun rumah dan manusia di dalamnya. Jika proses evakuasi terlambat, korban jiwa tidak bisa dihindari. Banyak kasus longsor di Indonesia yang menewaskan puluhan orang karena mereka tertimbun rumah yang runtuh.",
					"image": "res://assets/materi/longsor/dampak/menimbulkan korban jiwa.jpg"
				}
			]
		},
	},
	"banjir": {
		"name": "Banjir",
		"bg": "res://assets/materi/banjir/background.png",
		"ciri-ciri": {
			"bg": "res://assets/materi/banjir/ciri-ciri-bg.png",
			"contents": [
				{
					"id": 1,
					"title": "Naiknya Permukaan Air",
					"description": "Ketika air mulai naik setinggi 10-20 cm, itu bisa jadi tanda awal akan terjadinya banjir, terutama banjir bandang. Kenaikan ini bisa terjadi secara perlahan atau cepat, tergantung dari curah hujan dan kondisi saluran air di sekitarnya. Contohnya air mulai masuk ke halaman rumah, selokan meluap, atau jalanan mulai tergenang.",
					"image": "res://assets/materi/banjir/ciri/naiknya permukaan air.jpg"
				},
				{
					"id": 2,
					"title": "Hujan Terus-Menerus",
					"description": "Curah hujan tinggi yang berlangsung dalam waktu lama dapat membuat tanah jenuh air, menyebabkan saluran air meluap, dan meningkatkan risiko banjir. Ini sering terjadi pada musim penghujan. Contohnya hujan tidak berhenti lebih dari 2-3 jam tanpa jeda, terutama di daerah dataran rendah atau dekat sungai.",
					"image": "res://assets/materi/banjir/ciri/hujan terus menerus.jpg"
				},
				{
					"id": 3,
					"title": "Hujan yang Sangat Deras",
					"description": "Hujan deras dalam waktu singkat dapat menyebabkan air hujan tidak sempat diserap tanah atau dialirkan ke selokan, sehingga langsung meluap dan menggenangi daerah sekitarnya. Contohnya hujan dengan intensitas tinggi selama 30 menit bisa langsung menyebabkan banjir kilat di kota besar.",
					"image": "res://assets/materi/banjir/ciri/hujan yang sangat deras.jpg"
				},
				{
					"id": 4,
					"title": "Air Sungai Menjadi Keruh",
					"description": "Sungai yang tiba-tiba berubah warna menjadi cokelat atau keruh adalah tanda adanya aliran lumpur, tanah, dan sedimen yang terbawa dari hulu. Ini bisa menjadi pertanda akan datangnya banjir bandang atau longsor. Contohnya air sungai yang biasanya jernih berubah keruh, disertai aliran lebih deras dan cepat dari biasanya.",
					"image": "res://assets/materi/banjir/ciri/air sungai menjadi keruh.jpg"
				}
			]
		},
		"penyebab": {
			"bg": "res://assets/materi/banjir/penyebab-bg.png",
			"contents": [
				{
					"id": 1,
					"title": "Penebangan Liar",
					"description": "Penebangan liar adalah kegiatan menebang pohon secara sembarangan tanpa izin dan tanpa memperhatikan kelestarian hutan. Tindakan ini menghilangkan pohon-pohon yang berfungsi penting dalam menyerap air hujan ke dalam tanah. Akibatnya daerah resapan air berkurang, air hujan langsung mengalir ke permukaan tanah, dan potensi banjir meningkat, terutama saat hujan lebat.",
					"image": "res://assets/materi/banjir/penyebab/penebangan liar.jpg"
				},
				{
					"id": 2,
					"title": "Buang Sampah Sembarangan",
					"description": "Kebiasaan masyarakat membuang sampah di sungai, saluran air, atau drainase menyebabkan penyumbatan. Sampah seperti plastik, botol, dan kain sangat sulit terurai dan mudah menumpuk. Akibatnya aliran air tersumbat, air meluap ke jalan atau permukiman saat hujan, dan menimbulkan genangan serta memperparah banjir.",
					"image": "res://assets/materi/banjir/penyebab/buang sampah sembarangan.jpg"
				},
				{
					"id": 3,
					"title": "Curah Hujan Tinggi",
					"description": "Curah hujan tinggi terjadi saat hujan turun terus-menerus dalam waktu lama. Bila wilayah tidak memiliki sistem drainase yang memadai atau daerah resapan air terbatas, maka air tidak bisa dialirkan atau diserap dengan baik. Akibatnya volume air meningkat drastis, genangan meluas, dan banjir tak terhindarkan. Wilayah dataran rendah lebih berisiko.",
					"image": "res://assets/materi/banjir/penyebab/curah hujan tinggi.jpg"
				},
				{
					"id": 4,
					"title": "Bendungan yang Jebol",
					"description": "Bendungan adalah struktur yang dibangun untuk menahan aliran air. Jika tidak dirawat, bendungan bisa rusak atau jebol karena tekanan air yang tinggi, usia, atau kerusakan struktural. Akibatnya terjadi banjir bandang mendadak, air yang meluap menghanyutkan rumah, kendaraan, dan lahan pertanian, serta dapat menyebabkan kerugian jiwa dan harta yang besar.",
					"image": "res://assets/materi/banjir/penyebab/bendungan yang jebol.jpg"
				}
			]
		},
		"dampak": {
			"bg": "res://assets/materi/banjir/dampak-bg.png",
			"contents": [
				{
					"id": 1,
					"title": "Kerugian Ekonomi",
					"description": "Banjir dapat merusak rumah, kendaraan, barang elektronik, perabot rumah tangga, serta infrastruktur seperti jalan, jembatan, dan gedung. Akibatnya, masyarakat dan pemerintah mengalami kerugian finansial yang besar. Contoh dampaknya adalah biaya perbaikan rumah dan properti, hilangnya sumber penghasilan (usaha terganggu), dan harga barang kebutuhan pokok meningkat.",
					"image": "res://assets/materi/banjir/dampak/kerugian ekonomi.jpg"
				},
				{
					"id": 2,
					"title": "Masalah Kesehatan",
					"description": "Banjir menyebabkan air menjadi tercemar dan menyebarkan berbagai penyakit seperti diare, leptospirosis, demam berdarah, dan infeksi kulit. Genangan air menjadi tempat berkembangbiaknya nyamuk dan bakteri. Faktor penyebabnya adalah kekurangan air bersih, lingkungan yang kotor dan lembap, dan sulitnya akses ke fasilitas kesehatan.",
					"image": "res://assets/materi/banjir/dampak/masalah kesehatan.jpg"
				},
				{
					"id": 3,
					"title": "Menghentikan Aktivitas Sehari-hari",
					"description": "Banjir menyebabkan orang kehilangan tempat tinggal, sekolah ditutup, dan kegiatan ekonomi seperti bekerja dan berdagang terhenti. Akses jalan juga bisa terputus, membuat masyarakat sulit beraktivitas. Contoh aktivitas yang terganggu adalah anak-anak tidak bisa sekolah, pekerja tidak bisa pergi ke kantor, dan layanan umum terganggu (transportasi, pasar, dll.).",
					"image": "res://assets/materi/banjir/dampak/menghentikan aktivitas sehari hari.jpg"
				},
				{
					"id": 4,
					"title": "Rusaknya Fasilitas Listrik",
					"description": "Ketika banjir terjadi, aliran listrik biasanya dipadamkan untuk mencegah korsleting atau kebakaran. Selain itu, gardu listrik dan pembangkit bisa rusak karena terendam air. Dampaknya adalah mati lampu di daerah terdampak, gangguan komunikasi dan informasi, serta aktivitas rumah tangga dan industri lumpuh.",
					"image": "res://assets/materi/banjir/dampak/rusaknya fasilitas listrik.jpg"
				},
				{
					"id": 5,
					"title": "Menimbulkan Korban Jiwa",
					"description": "Arus banjir yang deras bisa menyeret manusia dan hewan. Banyak korban meninggal karena terseret arus, tenggelam, atau tertimpa bangunan roboh. Situasi darurat juga membuat evakuasi sulit dilakukan dengan cepat. Faktor risikonya adalah banjir datang mendadak (banjir bandang), minimnya sistem peringatan dini, dan kurangnya tempat evakuasi yang aman.",
					"image": "res://assets/materi/banjir/dampak/menelan korban jiwa.jpg"
				}
			]
		},
	}
}

func _ready() -> void:
	var current_materi

	if Global.game_controller.current_materi_type == Global.MATERI_TYPE.GEMPA:
		current_materi = materi["gempa"]
	elif Global.game_controller.current_materi_type == Global.MATERI_TYPE.LONGSOR:
		current_materi = materi["longsor"]
	else:
		current_materi = materi["banjir"]

	setup_scene(current_materi)

func setup_scene(current_materi):
	bg.texture = load(current_materi["bg"])
	card1.get_child(0).texture = load(current_materi["ciri-ciri"]["bg"])
	card2.get_child(0).texture = load(current_materi["penyebab"]["bg"])
	card3.get_child(0).texture = load(current_materi["dampak"]["bg"])
	card1.get_child(1).text = "Ciri-ciri " + current_materi["name"]
	card2.get_child(1).text = "Penyebab " + current_materi["name"]
	card3.get_child(1).text = "Dampak " + current_materi["name"]

func _on_back_button_pressed():
	# Kembali ke menu materi tanpa mengubah tipe materi saat ini
	Global.game_controller.change_gui_scene("res://scenes/materi_menu.tscn", Global.game_controller.current_materi_type, false)

func _on_ciri_ciri_button_pressed():
	Global.game_controller.change_gui_scene("res://scenes/materi_detail.tscn", Global.game_controller.current_materi_type, "ciri-ciri", false)

func _on_penyebab_button_pressed():
	Global.game_controller.change_gui_scene("res://scenes/materi_detail.tscn", Global.game_controller.current_materi_type, "penyebab", false)

func _on_dampak_button_pressed():
	Global.game_controller.change_gui_scene("res://scenes/materi_detail.tscn", Global.game_controller.current_materi_type, "dampak", false)
