Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id ED93460167
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Aug 2015 10:54:57 +0000 (UTC)
Received: by wibhh20 with SMTP id hh20so18614774wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Aug 2015 03:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=C4BtatqN/ROX/E9yaA9+GsOhPmQt5gX7sd0kcZ8FpXs=;
	b=dSgB6XNlPxBE6X1Ww6JRTuds/HbMlls+c7M8eP/ELDSkUYKX41i3C/213swulcp4UA
	W2r6lHobTKc0Scwi/Y0EEazHU2LsonoxQ7cabp4YyIZrh4ZT8hOxHfPQnu16ZGYzJ47H
	f7DPYHjzvqPcrMtXtxsW9U8/6wVUBwUEmvW19pdWAjng+GNPDW36/S6vULzvV/NQtFuv
	NSazxASf1X3V5qo4hTu8VJguQnfVm+VL3E4cyE6TqhiwRvWqOaIeo8YS4uGIYRZCLE8J
	Vvq22E8iPg8H1I+oIw6N5uLJfDCsNt2T3fvIHKMOUmfXZHau6xu5y0NikieWZ/nk+UZ3
	bJwQ==
X-Gm-Message-State: ALoCoQm1+S9Hcej9soq96V1qnDYXcan1BAyzw94oCCMYi9H2rdAghzANYq+/Uy0ZOKfofhR+WawC
X-Received: by 10.180.98.134 with SMTP id ei6mr4859213wib.49.1438858497619;
	Thu, 06 Aug 2015 03:54:57 -0700 (PDT)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	x6sm2673997wiy.6.2015.08.06.03.54.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Aug 2015 03:54:56 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org,
	Ash Charles <ashcharles@gmail.com>, Martin Jansa <martin.jansa@gmail.com>, 
	danismostlikely@gmail.com
References: <20150427105100.GB2379@jama>
	<1432309170-5575-1-git-send-email-ashcharles@gmail.com>
	<5567C5B1.7010901@windriver.com>
	<CAK8F28mc2C=r4n42xFmNaxNveectuB8esrkt4M2BkSknH-mFxw@mail.gmail.com>
	<CA+chaQe_T9zPjckAm+NZrZpdw5BO81eL-vxrAA-2kYymMRbd1w@mail.gmail.com>
	<CAK8F28=cu6z2m3hNGkO-qkzDhyfuZwPG-Q-n+2rY95NvmwuStg@mail.gmail.com>
	<556D3337.7020905@windriver.com>
From: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <55C33CFF.3070200@dresearch-fe.de>
Date: Thu, 6 Aug 2015 12:54:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <556D3337.7020905@windriver.com>
Cc: bitbake-devel <bitbake-devel@lists.openembedded.org>
Subject: Re: [bitbake-devel] [PATCH] fetch/hg: Disable checksums for archived downloads
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
X-List-Received-Date: Thu, 06 Aug 2015 10:54:58 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

On 02.06.2015 06:38, Robert Yang wrote:
> I'm working on fixing the issues now, will send patches sooner.

Any news on that?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

