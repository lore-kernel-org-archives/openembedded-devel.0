Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <developer@alexandfliss.com>) id 1Oey3v-00076o-BK
	for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 00:28:28 +0200
Received: by wyb38 with SMTP id 38so1744250wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 15:27:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.81.213 with SMTP id m63mr2275186wee.25.1280528859327; Fri, 
	30 Jul 2010 15:27:39 -0700 (PDT)
Sender: developer@alexandfliss.com
Received: by 10.216.235.233 with HTTP; Fri, 30 Jul 2010 15:27:39 -0700 (PDT)
Received: by 10.216.235.233 with HTTP; Fri, 30 Jul 2010 15:27:39 -0700 (PDT)
In-Reply-To: <201007292348.56359.roman@khimov.ru>
References: <AANLkTi=JK37hYh26rGz3sY5byksJ0js_ihjk4y7tq-ad@mail.gmail.com>
	<201007292348.56359.roman@khimov.ru>
Date: Fri, 30 Jul 2010 23:27:39 +0100
X-Google-Sender-Auth: R8cNLFhjvMLLEkbcrf8Kx2zsbdc
Message-ID: <AANLkTikLH1mVOLwJVbyQbgpYxqH2jZ2vebSnDgn11n5-@mail.gmail.com>
From: Alex Bennee <kernel-hacker@bennee.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: developer@alexandfliss.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] Version bump tzcode/data to 2010k
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Jul 2010 22:28:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Will do. I was having trouble getting git email set up so I used the web UI
(falsely) assuming it wouldn't munge it up.

On 29 Jul 2010 20:51, "Roman I Khimov" <roman@khimov.ru> wrote:

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D1=82=D0=BE=D1=80=D0=BD=D0=B8=D0=BA 27 =D0=B8=D1=8E=D0=BB=D1=8F 2010=
 13:58:21 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Alex Bennee =D0=BD=D0=B0=D0=BF=D0=
=B8=D1=81=D0=B0=D0=BB:

> -SRC_URI[tzcode-2010j.md5sum] =3D "5ba8345720296d3a659b349b2052d139"
> -SRC_URI[tzcode-2010j.sha256s...
I'd be happy to apply your patch, but

1) it's broken:

patching file recipes/tzcode/tzcode-native_2010j.bb
patch: **** malformed patch at line 49:
"f32b46405190e3a5f1ee4db9fb50aaf1379e6af4e5493402ebfc8ee757058e97"

Please resend it with `git send-email` rather than (what seems to be) copy-
pasting to e-mail client that word-wrapped it

2) "Signed-off-by" is missing (see
   http://wiki.openembedded.net/index.php/Commit_Policy )

Thanks.

--
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

