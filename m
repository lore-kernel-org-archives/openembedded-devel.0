Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id 60ADB738F6
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Mar 2015 12:56:18 +0000 (UTC)
Received: by yks20 with SMTP id 20so2560347yks.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2015 05:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=U445Z4FKX4eAsRvpGBt2OLzdWdxngAmhOgFGSzdAiHI=;
	b=shvyMmEfh8PGkQeOkR0ef0lj5817qrxSNr3nPqT7Vpg983AtYCqaJ3PU0/RHHWIBAF
	iNlFXxkyDo/EvVgoe7xuivutO45L2e9XD9/WErwXxTlqkdQ9egwd+TrZjdklopQQqLAI
	H3yv8sNTm3VjprDmrMd4XW/tFsuTZhhof8lfG9AsykbR/H6SpsTh86yXhNBc7Rj7nf+X
	xyXJWyVzGRC/DUplkage2u6GAUP3tBDfTiEFSaaMSAHg7i1H3ton1ysQpi6NP2Bc04pj
	wpT107SSJcD5iGSF05BHWf5+EHXQ6OwnLvPqwbewAFoFld6u3TTgauErBy1shrAeXYkj
	s5/A==
MIME-Version: 1.0
X-Received: by 10.170.132.144 with SMTP id y138mr30238734ykb.70.1425905780120; 
	Mon, 09 Mar 2015 05:56:20 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.112.71 with HTTP; Mon, 9 Mar 2015 05:56:19 -0700 (PDT)
In-Reply-To: <CAL5ScNULNnnK5NyZ9SN2q2fidHpDW8XR6DL_kkMujgTXDCogFw@mail.gmail.com>
References: <CAL5ScNULNnnK5NyZ9SN2q2fidHpDW8XR6DL_kkMujgTXDCogFw@mail.gmail.com>
Date: Mon, 9 Mar 2015 09:56:19 -0300
X-Google-Sender-Auth: mnRyvH_lFv8IYvVmmx0b3yX_kZ8
Message-ID: <CAP9ODKqqy9xU3NW=0LDzsVDokA5xiCnH49kY2Kw_wVSL9U1bQA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Frederico Cadete <frederico@cadete.eu>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qt5-git, qtbase, qt5everywheredemo: use https protocol for gitorious
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
X-List-Received-Date: Mon, 09 Mar 2015 12:56:22 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 9, 2015 at 9:52 AM, Frederico Cadete <frederico@cadete.eu> wrote:
> As of Gitorious 3.2, this service no longer supports the git:// protocol.
>
> Added ";protocol=https" to the SRC_URI's that are pointing there.
>
> Signed-off-by:Frederico Cadete <frederico@cadete.eu>

Being it now a GitLab company it seems good to move out to github and
avoid another migration in near future.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

