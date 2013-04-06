Received: from mail-ob0-f182.google.com ([209.85.214.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UOTZ7-0002Ys-Kn
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 15:54:17 +0200
Received: by mail-ob0-f182.google.com with SMTP id ef5so4447004obb.41
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Apr 2013 06:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=iNefE2LCNNFeo+3u+8HhKo9LA4XiHTnvVw/kZiHfiUk=;
	b=KbGWIKVpxF3C6xTucWD3H5K6kXeLfxSdF4GZUNGy+cWO3DPB9eJdU954kTCpsRXS0u
	rWBWK/acO9RlHoLZJyYwCVdUAIFDaaDOunc6osq7VK9r0lM+jupre7jde8/nB8Y/b3gY
	eoQqkfTI6MWcMzmveyGExkoJLnNgyRIg+mLrM0zgFGERGEfiiZLhAkaWXDYotOjjRFAA
	xdSR51SYhVyNC5DVF45CmLPRu9W5HBx5CGFOcZtMKhVyi9s6Vvrik7s7IkFtmkqGPGt8
	NMO+sQLfaf8e7rfRJD+4S3f9kNffq//zPr3KehnLMUt00h9wUXcCq5xp4hfX2fcYGYhY
	VtRA==
MIME-Version: 1.0
X-Received: by 10.182.131.168 with SMTP id on8mr913612obb.7.1365255401313;
	Sat, 06 Apr 2013 06:36:41 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Sat, 6 Apr 2013 06:36:41 -0700 (PDT)
In-Reply-To: <9e4a915b5a1e871ee28c3b723475d143162a8286.1365204818.git.paul.eggleton@linux.intel.com>
References: <cover.1365204818.git.paul.eggleton@linux.intel.com>
	<9e4a915b5a1e871ee28c3b723475d143162a8286.1365204818.git.paul.eggleton@linux.intel.com>
Date: Sat, 6 Apr 2013 10:36:41 -0300
X-Google-Sender-Auth: _qnCM1WzzVM6sLr4Ub4lV0A65PI
Message-ID: <CAP9ODKpt1GX0pbHx-=HKsJ9-BkZfhxQiAcJVdBkc4iGhu-bg+g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 4/4] qt4: remove bbappends
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
X-List-Received-Date: Sat, 06 Apr 2013 13:54:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Apr 5, 2013 at 8:35 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> These changes to Qt's configuration need to be applied in distro layers,
> not in meta-oe.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

NACK!

Keep PRINC as otherwise revision will go backwards.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


