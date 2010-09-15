Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OvvrH-0000Cv-0l
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 19:33:26 +0200
Received: by eyb7 with SMTP id 7so277014eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 10:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=Pc7fnMlnsmegHrGMlIhl+LMHzwGdCbcZBMR2FxHx2Fk=;
	b=wULyBkNVeQAKhh+gYJocUetyQmQKGDiMgl8ieY/uR45yVpssRvXX3Ih/nfIzamM9Y1
	7jP/BNlaUUm6hvD4Puktmg85arBRnYmHUZW+RWyeAJLebraaphiTCKsSet4zIvShnMdT
	XEkpM3lvypUkiWE0Z6fvwKBQXmAsgXmYWzB58=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=l/3ZVpkeOi+TCcxSEhtfi0xOUvODlbmeywQp5IIEA0ANGI4hsSpYX3cdiJB6sDlUiW
	CXvO3qLjId/GMgDRffjkx7Lpyubk45JV5jcOId1r2NT/PtgZNrrv9AVnbM8z+13TK8iO
	D3pcREvcM2/1+uGEvYsp0ckVn7rLger8p1CzE=
Received: by 10.223.114.83 with SMTP id d19mr837825faq.62.1284571954878; Wed,
	15 Sep 2010 10:32:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.121.5 with HTTP; Wed, 15 Sep 2010 10:32:13 -0700 (PDT)
From: AJ ONeal <coolaj86@gmail.com>
Date: Wed, 15 Sep 2010 11:32:13 -0600
Message-ID: <AANLkTinWDmigJDsU-vJqwujb9hXu7p7j4QpY=nYQq3rh@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Howto create a bitbake recipe
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
X-List-Received-Date: Wed, 15 Sep 2010 17:33:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

I don't know very much about this - only what I've seen discussed on the
mailing list.

I've created a template and given my just-submitted recipe as an example.

If you know bitbake and OE policies, please share the wealth:
http://wiki.openembedded.net/index.php/How_to_create_a_bitbake_recipe_for_dummies

AJ ONeal

