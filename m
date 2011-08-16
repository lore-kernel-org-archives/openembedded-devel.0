Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1QtR6w-0003r8-67
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 23:23:46 +0200
Received: by gyg4 with SMTP id 4so280798gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2011 14:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=c+MaNILlWkQ/NSq9RwaD4d7blod8jvdRSVo5WGKuYJE=;
	b=A8ky5WT7GwU2tBkvboCk8OjrITRO/mL+SeGgyNgZThrFOXeVGmYWzEnuqHTEER6ZuL
	TMVVXClb/U/MW7WgnvyCaXW5hTtKOt2I6QSS930oMHsVKhVAymq7x8VZ3JDQOl5yZTiQ
	z5ZBgD15MdbSDUgvOTKTi28TFybEKtOG0fuR0=
MIME-Version: 1.0
Received: by 10.236.184.233 with SMTP id s69mr751202yhm.94.1313529547555; Tue,
	16 Aug 2011 14:19:07 -0700 (PDT)
Received: by 10.236.106.100 with HTTP; Tue, 16 Aug 2011 14:19:07 -0700 (PDT)
In-Reply-To: <CAOd_LFx5+NyXY4cTZ76yfccaFea8_WsFm2t_ZnkLk1xKD9Xzyw@mail.gmail.com>
References: <CAOd_LFx5+NyXY4cTZ76yfccaFea8_WsFm2t_ZnkLk1xKD9Xzyw@mail.gmail.com>
Date: Tue, 16 Aug 2011 17:19:07 -0400
Message-ID: <CAOd_LFyt71x1pYU+LZGLDAbTFBGeS+5YmUtE5-RQkm9WL66jxw@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: error building PXA270 target with oe-core/angstrom
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
X-List-Received-Date: Tue, 16 Aug 2011 21:23:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2011 at 3:32 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> Has anyone build oe-core/angstrom for a PXA270 target recently? =A0I
> tried spitz, and am getting the following:

The build that is failing is on a Ubuntu 10.10 machine.  The same
setup on a Ubuntu 11.04 machine seems to get past gcc-cross-initial,
and a beagleboard build on my 10.10 machine that is failing with spitz
also seems to be working.  Maybe I'll clean and try again.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


