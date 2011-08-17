Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1QtfMD-0008WD-EW
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Aug 2011 14:36:29 +0200
Received: by gyg4 with SMTP id 4so662756gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2011 05:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=iNoINvAyNyqwLdCSpAtbMl/S69bUkwJ4BINpTl67TJY=;
	b=Q5VZofe06Yd7BY56ZxAEoArUG3g4hxF7nIjl2NE8gqYelYA8J+G2hTx8mvHYzJ2ElI
	Uw2AvuRiyVQEL8IZK5e86rO2GsMWHSUY4oZS1/E75yKe6IsTS13wpLOlEfJAZZe5lAOo
	2nCHY4VYoszes3WssYW0icHN8Mi5ph0OO2w8Q=
MIME-Version: 1.0
Received: by 10.236.184.233 with SMTP id s69mr3050036yhm.94.1313584310312;
	Wed, 17 Aug 2011 05:31:50 -0700 (PDT)
Received: by 10.236.106.100 with HTTP; Wed, 17 Aug 2011 05:31:50 -0700 (PDT)
In-Reply-To: <CAOd_LFyt71x1pYU+LZGLDAbTFBGeS+5YmUtE5-RQkm9WL66jxw@mail.gmail.com>
References: <CAOd_LFx5+NyXY4cTZ76yfccaFea8_WsFm2t_ZnkLk1xKD9Xzyw@mail.gmail.com>
	<CAOd_LFyt71x1pYU+LZGLDAbTFBGeS+5YmUtE5-RQkm9WL66jxw@mail.gmail.com>
Date: Wed, 17 Aug 2011 08:31:50 -0400
Message-ID: <CAOd_LFxmSkRCm_y7EYBa2szURSeje0CUrXdvX_bo6C6Vzm-DXg@mail.gmail.com>
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
X-List-Received-Date: Wed, 17 Aug 2011 12:36:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2011 at 5:19 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> On Tue, Aug 16, 2011 at 3:32 PM, Cliff Brake <cliff.brake@gmail.com> wrot=
e:
>> Has anyone build oe-core/angstrom for a PXA270 target recently? =A0I
>> tried spitz, and am getting the following:
>
> The build that is failing is on a Ubuntu 10.10 machine. =A0The same
> setup on a Ubuntu 11.04 machine seems to get past gcc-cross-initial,
> and a beagleboard build on my 10.10 machine that is failing with spitz
> also seems to be working. =A0Maybe I'll clean and try again.

The failing build seemed to work the 2nd time after I cleaned tmp ,
and restarted -- strange!

Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


