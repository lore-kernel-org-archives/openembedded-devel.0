Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OgjXE-0004Nh-GQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 21:22:12 +0200
Received: by fxm12 with SMTP id 12so2635062fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 12:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=0gp9oBeE3k3dT8hl6F0d9uYAxgCjQ0mz0Ie5VTlhvMY=;
	b=SupsAXbku8+C1Rkf2Vn96BX1oFgw2gntKMe5OA4qGM9qWyyhOK94GzEc1bsoqhfe/s
	Z536MGA0uWL5DeNieVxFEhTSOtYCpRS9vBaew0+afJC6GmIgIMDhN9cOqQt7C+usOwTH
	+RF0TgNDEgVuTOTlvcl+6cbzFV236UtYroxiE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=J0diLPeogcsiI5aCDB20GTcJIUfdWwieFiv+OYrQKujXtcJfLXLw6kVCErLeyrKA/V
	nrR/0GWQoluCOr8fQmlCRo8cPMACG0Cuh+uOEEX64s7CbRoQ1RW+INgzaZAjQYP7F4Q1
	rVQ6AGyOWsrKRrfYc+domkEaYaXOwx19/rSbs=
MIME-Version: 1.0
Received: by 10.103.172.10 with SMTP id z10mr868945muo.44.1280949696404; Wed, 
	04 Aug 2010 12:21:36 -0700 (PDT)
Received: by 10.102.213.28 with HTTP; Wed, 4 Aug 2010 12:21:36 -0700 (PDT)
In-Reply-To: <1280948285-3458-7-git-send-email-raj.khem@gmail.com>
References: <1280948285-3458-1-git-send-email-raj.khem@gmail.com>
	<1280948285-3458-7-git-send-email-raj.khem@gmail.com>
Date: Wed, 4 Aug 2010 21:21:36 +0200
Message-ID: <AANLkTineQnzb6Bdsehc7CoSNPQ0wfDWyZhH5Fs7U046G@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 6/7] recipes: inherit autotools instead of autotools_stage
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
X-List-Received-Date: Wed, 04 Aug 2010 19:22:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Visually inspected. Looks ok to me.

