Return-Path: <cliff.brake@gmail.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 85AD96FE34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 14:04:51 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id x12so721037qac.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 07:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=df06wOiP5aUHqTNX4kFnYqtTjq30Z9w0ys9Amo6rmNI=;
	b=JZ+K6wsv8AZJYB9xL6j3WPPPHhhnL3IHZuc1DoxHtjK59dRS66BwYeUr7hECmvEVRU
	6cwGSkle18bkDoBDZo0OSSt/bWSaB/GT+2Yz0ADKHP7wlMW9qKyeBWWoGD/9dhbitjuO
	SMHM2BaatxKWSXhiIdXGW1Xn6snIS5lYEv78H+HR+QMee5rAva8xDSLNYGU+27nCKKEB
	zSL1HQ5mKPzRq5Lopf4UxOOFD5ycCBiIkdLSrUdZPkLALzgqUfZ0UpYKxBA9x/8p22zn
	vQ9TgC5IwT0RhWtvNpYU5q03bE/uh4YlPGcATGembCb648QNBLRpg0GdVjsJ/NyXfZMu
	KbUQ==
MIME-Version: 1.0
X-Received: by 10.140.94.103 with SMTP id f94mr3381637qge.64.1403100292590;
	Wed, 18 Jun 2014 07:04:52 -0700 (PDT)
Sender: cliff.brake@gmail.com
Received: by 10.140.31.73 with HTTP; Wed, 18 Jun 2014 07:04:52 -0700 (PDT)
In-Reply-To: <CAP9ODKr1QTT++D-iiAwT5LgftiZdmzT34xMM_2dkHF5Ti99KnA@mail.gmail.com>
References: <20140430143741.GL2486@jama>
	<CAFeBWL5HuWex48xB_JZX_C7RMhzgfH93=AVJAkO7Qk7DUToFxg@mail.gmail.com>
	<20140505164514.GM2486@jama> <536A7C42.6030502@balister.org>
	<20140511145337.GE22774@jama> <20140616134850.GP2428@jama>
	<CAP9ODKr8=FnXhWranpckyRrPrHzpfCW-fYLxF4S1o_7sYRMFVA@mail.gmail.com>
	<CAOd_LFzTMonJL_17KyR6e-g8U_ByPRakj26n41qEY2-psOevsw@mail.gmail.com>
	<CAP9ODKr1QTT++D-iiAwT5LgftiZdmzT34xMM_2dkHF5Ti99KnA@mail.gmail.com>
Date: Wed, 18 Jun 2014 10:04:52 -0400
X-Google-Sender-Auth: zUci8030YfT7b88RoBNIhikqPBA
Message-ID: <CAOd_LFz4ArrStfheb4+KKhwhWPDft5BYjqNk7Y05Ja=oDk+ZSg@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: daisy branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Wed, 18 Jun 2014 14:04:59 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 18, 2014 at 7:27 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:

>
> Are you willing to take meta-qt5 too?

Sure.

https://github.com/cbrake/meta-qt5/commits/daisy-to-merge

I made some more updates to the meta-oe daisy branch:

https://github.com/cbrake/meta-openembedded/commits/daisy-to-merge

Otavio, Armin, would you like me to add your emails to the maintainer
lists in these readme's as well?

Thanks,
Cliff

