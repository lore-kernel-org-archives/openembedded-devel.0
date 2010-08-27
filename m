Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elena.valhalla@gmail.com>) id 1Ooy75-0006n5-Gh
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 14:32:57 +0200
Received: by qyk8 with SMTP id 8so603173qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 05:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=YH4Fvn63bU6ilsM/VzwK+T3W+ZZW+gynYrXda4JT++o=;
	b=ZyO43HwHJ7QhuFVuenOxBmTuXxt6gXWzLnuHw4wXjUfYYSIG1ExfghEdhhKsfY6eb0
	h2PzmibMyWjfol8lUu6TxySsGMbMKVzYPFUZe5R/nSGPJ+LWg8aBAeNQbOgd7SgZCOdz
	oMpgok+2RgNxnqdhGbI9q7slqbnLOlm9zEfnw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=vzIyLTRCXt7P4kzJJr9mo+1CKoFoejoYnqByOauEPIXIVCmqhUxYcucofFJMofhUSY
	y4O7RzezlUm7lJ/IC6PySKVX6sCvbTghn84oLdHt98LdaoQXzz7e3yEM3BXaFk7X7On8
	lH93TinDooKIqglxyJ8u7fLX4FP+dJrPXliso=
MIME-Version: 1.0
Received: by 10.229.191.147 with SMTP id dm19mr468196qcb.33.1282912343236;
	Fri, 27 Aug 2010 05:32:23 -0700 (PDT)
Received: by 10.229.234.76 with HTTP; Fri, 27 Aug 2010 05:32:23 -0700 (PDT)
In-Reply-To: <i586bt$t12$1@dough.gmane.org>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>
	<i586bt$t12$1@dough.gmane.org>
Date: Fri, 27 Aug 2010 14:32:23 +0200
Message-ID: <AANLkTi=wiFDsP33tndm0HA7jBkTUzsStWLfz5wc8J+0z@mail.gmail.com>
From: Elena of Valhalla <elena.valhalla@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: elena.valhalla@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] recipes: Update recipes to get 'bitbake world' parse and calculate runqueue successfully.
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
X-List-Received-Date: Fri, 27 Aug 2010 12:32:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 8/27/10, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> (...)
>>  recipes/sugar/sugar-fructose.bb                    |    2 +-
>
> NAK

IIRC this one has never worked (no sugar-web-activity), and should be
changed in a task anyway

(which is in my long-term plans to do)

-- 
Elena ``of Valhalla''

homepage: http://www.trueelena.org
email: elena.valhalla@gmail.com


