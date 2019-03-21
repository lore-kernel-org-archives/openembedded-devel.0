Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id DE9C2601F2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2019 21:09:02 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id z126so462502itd.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2019 14:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=sQtfnG0NvU0uLIylYIvirZsO75zjghCK4qCexoxks/Y=;
	b=he3rmtg/WhrhGdsIwtXRG29FZ+wFrLPCnhtbb0nGVR0Q3zGP0kEOZqmQIV+HDz8KEv
	x2N2dGK4plFYmyZ4fzp/VOoSc7b8oE7/kF15lZXlk45Ak21CIKxcRj++AOlFHkSPw/JL
	cArZ193LlBSxkSVEUbAUiVWoAsp+IjgKFnMdGmBGZ3M3A28py8FeD3Gs5FPH1BOBSROt
	BJ2Scj2SWyDGRfvAK+Q7l4FWCUUz5Qq4dzbzfsng/ELXyE2sU5RqUbCxPA4dS95ZmJgH
	k6RWWKtWWaPT5uvAlMX1z4zNCCqfEQCEZiB6ag4fse86U2du+5Rk9ZMYp+akQNLiRkNJ
	YVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=sQtfnG0NvU0uLIylYIvirZsO75zjghCK4qCexoxks/Y=;
	b=Ct6FBxGhX79F4+6gq75rh2MH8+Inoxtehpznz4HFK9+Yuecr3NCNugBpNMyjDOem/T
	vyk8kLPftJJI7dOeeAgth4Ex+qdWskKLfZYRSeiO6CKX0bDnl2Ow1BU8DBq90RgBR7V1
	OraaRSWfTP9I5BGxnn3OQK2/yFix1vgdXbKaOPxoamADNSvguPUGQlmBketg54viRX5k
	6WgFnZGL4fim/Z6xzydhveXb7Lz02S+6J1RFWKqvpd3/x23Zq5d8vbQvmeh+XYbEWQb8
	aY/mZVi4Wxlxc82eOJsxJc5tiprCiligdRR47XjSOnDaePLIeYzit4XlEciGKTvXm9La
	wDOw==
X-Gm-Message-State: APjAAAWo5Bw6q/b9x3FL4YPeJxAYEFsb2cPp7Ku686RaD6gBpn9++MhO
	rbRtH4P06ZrehzbB0rUE+om5O2Db
X-Google-Smtp-Source: APXvYqxdhSLGUJT5jBtJQBsBVCSAbMt2pUZOC2fnTPHnDPBF88I/cRp2W1iY83+GJWN8gMW0DdebzQ==
X-Received: by 2002:a24:89c3:: with SMTP id s186mr54945itd.112.1553202543694; 
	Thu, 21 Mar 2019 14:09:03 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	a77sm366188itc.5.2019.03.21.14.09.02
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 21 Mar 2019 14:09:02 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <6a15a264cf5e3cbe0df1614387cd2eb9fc421ac7.camel@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	openembedded-devel@lists.openembedded.org
Date: Thu, 21 Mar 2019 16:09:02 -0500
In-Reply-To: <60184de2d95445a984762c674ebbd809084ea438.1534182463.git.paul.eggleton@linux.intel.com>
References: <cover.1534182463.git.paul.eggleton@linux.intel.com>
	<60184de2d95445a984762c674ebbd809084ea438.1534182463.git.paul.eggleton@linux.intel.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 4/4] faad2: set LICENSE_FLAGS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Mar 2019 21:09:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-08-13 at 19:50 +0200, Paul Eggleton wrote:
> Commercial usage requires a license according to the homepage, so set
> LICENSE_FLAGS = "commercial" to indicate that.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta-oe/recipes-multimedia/faad2/faad2_2.7.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb b/meta-
> oe/recipes-multimedia/faad2/faad2_2.7.bb
> index b777831ad..9e5a3817a 100644
> --- a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
> +++ b/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
> @@ -5,6 +5,8 @@ LICENSE = "GPLv2"
>  
>  LIC_FILES_CHKSUM =
> "file://COPYING;md5=381c8cbe277a7bc1ee2ae6083a04c958"
>  
> +LICENSE_FLAGS = "commercial"
> +

My understanding was that faad2 was GPLv2, but you could *optionally*
get a commercial license for it if you needed one. Is the LICENSE_FLAG
necessary in that case? It seems like the default license of GPLv2
would apply unless you worked something out with them to get a
commercial license?

>  PR = "r1"
>  
>  inherit autotools
> -- 
> 2.17.1
> 
-- 
Joshua Watt <JPEWhacker@gmail.com>


