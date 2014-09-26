Return-Path: <cliff.brake@gmail.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3375360167
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Sep 2014 14:25:10 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id w7so3925380qcr.40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Sep 2014 07:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YavIQ75meCPbQvKu+THtgYD/nW0Nw62J6ITyFAj+q18=;
	b=vqfogiKBq6LxPG907qGa6mi90T2nF+Z2UbTDL1uD0LqSpZajHuo/zbkXJCOdsjiZoa
	Y7dUDgNspr+oFDQ8ViqReCR6N5JcVD+Zn+8gbEwybSsZHq9zT5GwQy+rqdWJZjTQj8Xl
	QWChxGd105ONaAkViRip6BZqaW+O4eiuHzV4OY2wRvSpgzaAUXj1TQZyLKEWfBIe/Ay+
	MPrfoqraKA1P9xhfMsn8Jvltimh2Daxf3wMef0jE9qf+7Vm+WqG7CnG5bX9EB1B3VzsK
	/UykcQihgTKLDvorQcVdbDI2araK6Gq9cZe5sqxiGTPcerua8wXPVwxbT3dIxDDg8bTP
	7iOQ==
MIME-Version: 1.0
X-Received: by 10.140.23.177 with SMTP id 46mr33525688qgp.64.1411741511671;
	Fri, 26 Sep 2014 07:25:11 -0700 (PDT)
Sender: cliff.brake@gmail.com
Received: by 10.140.93.201 with HTTP; Fri, 26 Sep 2014 07:25:11 -0700 (PDT)
Date: Fri, 26 Sep 2014 10:25:11 -0400
X-Google-Sender-Auth: xPApFaOWS_r1rmqfXdpuaBcYMzA
Message-ID: <CAOd_LFwvwKvJWXpc4uhYqm4i61vs37isLNmzf5DqjmBvTeiR6w@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][daisy] pull request libmikmod: Adjust SRC_URI (2014-09-26 09:22:37 -0400)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Sep 2014 14:25:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The following changes since commit 662cf409c1175450699d498085f3c894e0fe81d0=
:

  php: Fix native build due mistakenly linking against host's iconv
(2014-09-01 11:45:23 +0200)

are available in the git repository at:

  https://github.com/cbrake/meta-openembedded.git 2014-09-26_merge-to-daisy

for you to fetch changes up to 8e6f6e49c99a12a0382e48451f37adac0181362f:

  libmikmod: Adjust SRC_URI (2014-09-26 09:22:37 -0400)

----------------------------------------------------------------
Oliver St=C3=A4bler (1):
      libmikmod: Adjust SRC_URI

 meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

