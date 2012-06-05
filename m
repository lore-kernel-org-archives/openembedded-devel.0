Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel.mcdougall@liftoffsoftware.com>)
	id 1SbyLg-0001Vo-Jo for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jun 2012 20:19:20 +0200
Received: by wgbds1 with SMTP id ds1so3376305wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2012 11:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=J/VD8hHytVx3bDcdnZ8DZp0+PLCT/W5Z/dkTYZuP4Vk=;
	b=ewIpprblI2e2NTtfkBMQhxdR847WTy8r+NGyJeG13F6dZmd2jY8F4ljADItvJoRnwK
	XO6cryB7F/M2fl8Wz33X9FjUNl4UjoWlY0HcakP1Dwy90WBEaI7+S5IC9oWKDKL+B+f1
	iLm4MOM9v3QSSzzTZb8+XXhT7jSfOntrBaet7xNC1vDIkuiKjPExyP1znbtpi8v59VS5
	iGzhJdhTam3bYLgXlSywg60lwXdCfvja7aRpmFMfXKKaIAWo+JFpFeaIgiCCvbho7l2e
	QOdfqR6sjyweVpLZYofLlOdNKipxX9HLESIvZM6ZB3DrPYfaAxV1rNR9ODHvtInnUPHJ
	EBVA==
MIME-Version: 1.0
Received: by 10.216.142.102 with SMTP id h80mr15161186wej.36.1338919734389;
	Tue, 05 Jun 2012 11:08:54 -0700 (PDT)
Received: by 10.223.76.200 with HTTP; Tue, 5 Jun 2012 11:08:54 -0700 (PDT)
X-Originating-IP: [173.76.156.208]
In-Reply-To: <4FCD2043.7010207@balister.org>
References: <1338831160-14023-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
	<4FCD2043.7010207@balister.org>
Date: Tue, 5 Jun 2012 14:08:54 -0400
Message-ID: <CAG3aBq5eaz-Xt7K-cR8qPAfqgUzsKamG+wMpzSPXVy7UbH_nhg@mail.gmail.com>
From: Daniel McDougall <daniel.mcdougall@liftoffsoftware.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmTsFtrLL3NiAfBgVxOzAdw4Vxt/+CBtQyM+UIGScaH2HgMkBCAQm2M+jQ3ibZ/6sSK9DvE
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH] python-numpy: Fixed numpy dependencies.
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
X-List-Received-Date: Tue, 05 Jun 2012 18:19:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 4, 2012 at 4:53 PM, Philip Balister <philip@balister.org> wrote=
:

> Can you make the commit message something like:
>
> python-numpy : Add missing dependencies.
>
> Numpy was missing a number of dependencies in the .bb file without which
> it will not work.
>

No problem.  I'll re-submit the patch with that change right now.

--=20
Dan McDougall - Chief Executive Officer and Developer
Liftoff Software =E2=9C=88 Your flight to the cloud is now boarding.
904-446-8323

