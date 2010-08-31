Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1OqVsk-0002rn-Fu
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 20:48:31 +0200
Received: by wyg36 with SMTP id 36so7632252wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Aug 2010 11:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=+vN2dlAHwN5ZxB6ntP0+AK49nWIhFvmd3Tbop8iFqSY=;
	b=Jt3e7kTJOuhuGeCky+cEJNeDMmxWmnz3WLmUWWzLfUAiztf/XVG52oEm2ccibLQX2L
	bJZ9tL/56FRSG99EJPrfkp3U5En47K/KGbyoE5VJYzo7p0JGzWlYsjgvFwQQnEepgzdU
	CDfv8owhmG3BlrbaNcvdfFFeUEFeZi/WSio48=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=UeRbFt7T8EyLhp/HVi+jQcZDYPP/hgFjtKNbKAjlCFTgbXqbqY69ZP3OZY0pRPza6B
	dZrFbfig5GGeZ7BZut1hFOrALwrvoR1cVG667FlD0avbjwXBkWJiZeLBUG/GgfRSrFzL
	UJsS3Mt1W1tQtNXMPiCnNlnpio6CwKYR1U0RY=
MIME-Version: 1.0
Received: by 10.227.137.81 with SMTP id v17mr6843218wbt.10.1283280477443; Tue,
	31 Aug 2010 11:47:57 -0700 (PDT)
Received: by 10.227.142.79 with HTTP; Tue, 31 Aug 2010 11:47:57 -0700 (PDT)
In-Reply-To: <1283225499-11712-1-git-send-email-raj.khem@gmail.com>
References: <1283225499-11712-1-git-send-email-raj.khem@gmail.com>
Date: Tue, 31 Aug 2010 20:47:57 +0200
Message-ID: <AANLkTi=E_FYb3OLpKS4ikXjXn1xn-f-H4tur5A0mNjN6@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] make_3.82.bb: Add new recipe.
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
X-List-Received-Date: Tue, 31 Aug 2010 18:48:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Khem,

On Tue, Aug 31, 2010 at 5:31 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Leon Woestenberg <leon@sidebranch.com>

Regards,
-- 
Leon


