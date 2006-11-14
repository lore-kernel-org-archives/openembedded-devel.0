Received: from [64.233.182.185] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <acassis@gmail.com>) id 1GjwQP-0006Ef-NG
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Nov 2006 12:25:57 +0100
Received: by nf-out-0910.google.com with SMTP id l24so244550nfc
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Nov 2006 03:23:53 -0800 (PST)
Received: by 10.78.201.15 with SMTP id y15mr891314huf.1163503433255;
	Tue, 14 Nov 2006 03:23:53 -0800 (PST)
Received: by 10.78.194.14 with HTTP; Tue, 14 Nov 2006 03:23:53 -0800 (PST)
Message-ID: <37367b3a0611140323i77b82228j328e9ecfab710711@mail.gmail.com>
Date: Tue, 14 Nov 2006 09:23:53 -0200
From: "Alan Carvalho de Assis" <acassis@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Ipatience needs fltk with libXext
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Nov 2006 11:25:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Koen,

I forget to add a dependence to ipatience.
The current fltk has a bug, it need libXext but it is not defined on .bb.

Juan has submitted a fix to fltk, but it is not applied:

http://bugs.openembedded.org/show_bug.cgi?id=3D1555

Can you please verify it?

Cheers,

--=20
------------------------------------------------------------
|                     Alan Carvalho de Assis                |
------------------------------------------------------------
--
N=E3o importa o que os outros ir=E3o pensar,
A cura para a infelicidade =E9 a felicidade


