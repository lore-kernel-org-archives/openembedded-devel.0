Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4480372DAE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 22:36:32 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 79so2795471ykr.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 14:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Ok6WDTeCgwcGxtJUVmQyKIfabQno+PMZkxN/LaT1FGk=;
	b=fQmGI+4Qqk46+1764zV+8LXst20sk3lc+G8rO0GdTIovGciPitHRgjxMgeHuVVIdEm
	kWvMW8tWUl6jVrussCML+5mQVyNRsEAqFm6i0IxVc9bBQq+5k+CfcjV3HPbRMMSEbKyK
	giTxsgzbipYsrpDjfmaUU/0Lv9JiAYl6mEsS+vq0jb+Y1v0R/yzwg9UOcsAKjgaTPyty
	vSAXJg5noZMf1CqZyMvoCNgrK3dES+WffUfTf+uIzuWydkVJd4vz8OGo9tfquE83vMKF
	bM3bHc8O3jPIhdsJpK1t3JFJ3WZWBWYHkbPHr1Hx5+rnBkhgkg3ymu+3VWsv4YXM/Kf6
	R6hA==
MIME-Version: 1.0
X-Received: by 10.236.210.5 with SMTP id t5mr808070yho.104.1423694193294; Wed,
	11 Feb 2015 14:36:33 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Wed, 11 Feb 2015 14:36:33 -0800 (PST)
In-Reply-To: <1423649212-5156-1-git-send-email-pau.espin@aweurope.be>
References: <1423649212-5156-1-git-send-email-pau.espin@aweurope.be>
Date: Wed, 11 Feb 2015 20:36:33 -0200
X-Google-Sender-Auth: g4hK3wk3gQnEe68XzVUTqRRyIJg
Message-ID: <CAP9ODKpzYyVB+K6XZ=oQtYZ_TSce19D0r=_bk5RPxxtvVUgxhw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Pau Espin Pedrol <pau.espin@essensium.com>
Subject: Re: [meta-qt5][PATCH] qtmultimedia: Enable building of package qtmultimedia-examples
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
X-List-Received-Date: Wed, 11 Feb 2015 22:36:41 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 11, 2015 at 8:06 AM, Pau Espin Pedrol <pespin.shar@gmail.com> wrote:
> From: Pau Espin Pedrol <pau.espin@essensium.com>
>
> Signed-off-by: Pau Espin Pedrol <pau.espin@essensium.com>

I am wondering why your examples were not build. Mine were build.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

