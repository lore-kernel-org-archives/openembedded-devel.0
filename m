Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel.mcdougall@liftoffsoftware.com>)
	id 1ScRoZ-0004XI-FR for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jun 2012 03:47:07 +0200
Received: by werg55 with SMTP id g55so48303wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2012 18:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=0L1idSdCA/V4ICGjXTqMt8zsa5Wfp7zCocJYV+zsS7E=;
	b=RIYT1tDAZSxIHQHFxnf2QHF8eW8FGJ44yco0wJPFYag9xzj5V/vDKMMDDWEspLGp6m
	Tx7IcWpjETd4bb54n7ZFtgY73QOoZxE5URJ/fGpPrWJe8fpl9G+4qSmM/YhrL7vbbM/E
	yvB6qpZ50+ACyghAfIxtWwLNcUIz3Ju3lNG6yBESGD1fU2GfKZqe4o5vs/FUU6kjpgoM
	Iij0yeme2/hQWjINuYVmhcyUan9SyI9QG4ObVQHx+4Fy3TYMni5FCOek09CeCWPO27Jf
	/rkWh3S7dUUBTQNzo3m9GqU5P7dkJo1ZvZKrgsiEQ5eO7SymOq+x5H0Yw3vowIeYdnqa
	Hxgg==
MIME-Version: 1.0
Received: by 10.216.216.95 with SMTP id f73mr227302wep.149.1339032999651; Wed,
	06 Jun 2012 18:36:39 -0700 (PDT)
Received: by 10.223.76.200 with HTTP; Wed, 6 Jun 2012 18:36:39 -0700 (PDT)
X-Originating-IP: [69.180.64.152]
In-Reply-To: <4FCFEB16.1010309@balister.org>
References: <1338996004-32583-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
	<1338996004-32583-2-git-send-email-daniel.mcdougall@liftoffsoftware.com>
	<4FCF76D6.4040909@mlbassoc.com>
	<20120606153232.GE3140@jama.jama.net>
	<CAG3aBq5_5y2QTHu94HYZ-hY+J0i23tsfiRcc58NWQYLUaJ8VkQ@mail.gmail.com>
	<4FCFEB16.1010309@balister.org>
Date: Wed, 6 Jun 2012 21:36:39 -0400
Message-ID: <CAG3aBq6ouAB6O=fzLMhjZpv308cy9DR4tsx2=77Omym4u5a0AA@mail.gmail.com>
From: Daniel McDougall <daniel.mcdougall@liftoffsoftware.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnddVCmGA1+nK8s1caMTy+jGvKuGI9PIFiS4jNMskG8+zrDvO5LcUHk+YYcEBX1/CtMtC7U
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH v2 2/2] python-numpy : Correct difflib dependency.
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
X-List-Received-Date: Thu, 07 Jun 2012 01:47:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 6, 2012 at 7:43 PM, Philip Balister <philip@balister.org> wrote=
:
>
>
> I wonder if you take a different path through numpy, will it import some
> additional python modules?
>

I don't think so.  I ran through a bunch of tests with my python-numpy
package and all went well.  I didn't encounter any errors.  Given, I didn't
test *everything* :)

--=20
Dan McDougall - Chief Executive Officer and Developer
Liftoff Software =E2=9C=88 Your flight to the cloud is now boarding.
904-446-8323

