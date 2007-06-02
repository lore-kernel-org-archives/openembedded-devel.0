Received: from [64.233.162.233] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <cliff.brake@gmail.com>) id 1HuVD7-0004gn-BD
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jun 2007 17:08:09 +0200
Received: by nz-out-0506.google.com with SMTP id 8so639386nzo
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2007 08:06:11 -0700 (PDT)
Received: by 10.114.175.16 with SMTP id x16mr2992790wae.1180796770900;
	Sat, 02 Jun 2007 08:06:10 -0700 (PDT)
Received: by 10.114.185.15 with HTTP; Sat, 2 Jun 2007 08:06:10 -0700 (PDT)
Message-ID: <f96d234e0706020806pbe320e2m2bce3c666f045ebd@mail.gmail.com>
Date: Sat, 2 Jun 2007 11:06:10 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ae36f8040706011341m111d2fafs850a390bb25399a9@mail.gmail.com>
MIME-Version: 1.0
References: <ae36f8040706011341m111d2fafs850a390bb25399a9@mail.gmail.com>
Subject: Re: Use with DENX toolchain
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
X-List-Received-Date: Sat, 02 Jun 2007 15:08:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 6/1/07, Lu=EDs Cargnini <lvcargnini@gmail.com> wrote:
> Hi, Dear colleagues
> Please i want to use Openembedded with Denx Toolchain, how I should
> configure my build/cond/local.conf to use my installed denx toolchain ???

http://www.openembedded.org/user-manual&dpage=3Dcommonuse_prebuilt_toolchai=
n

another example: http://bec-systems.com/web/content/view/56/9/

Most of the time, you are best off using the toolchain OE builds,
unless you have a really good reason to use a different one.

Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


