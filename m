Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SwIEu-0006vZ-9f
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 21:36:20 +0200
Received: by yhjj56 with SMTP id j56so5840890yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2012 12:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=f/ug9+wY/LwMMrN21QYmB11K+xgy6djAmbhD6Gc5CoE=;
	b=SqC2A717cCWsW+uC1IRKVM9er0ltnJ5VA4z/vmb6GelLxhGF1BhbZc77Ys5y71gyMk
	e4TzWjohIIMRuqNOEvtEfGpo5aG7u3o9bm9+cZlseHQBy5Xez48SCewqvWq0h+RwxrBW
	lw48PgPI3g0bZsm94pEWtmy1lIYjy+rF25v2f2OiRFyegenZ8a+2K1OqyWTFllADAq/b
	OuxfKnax3x2w/oueyfljLtozLldxtzQ2Emm8yppqJgj+Lo8oSaTQD6RcRY0hgjo0Ofet
	bNS3Pd4AkIx1n6hgTkpTGBDFudxaErfqCSyANgsL1EnOGy1jCG/C22f6mcrPb0gpPMtF
	9Eww==
Received: by 10.50.219.197 with SMTP id pq5mr3008470igc.21.1343762682389; Tue,
	31 Jul 2012 12:24:42 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.50.95.138 with HTTP; Tue, 31 Jul 2012 12:24:21 -0700 (PDT)
In-Reply-To: <jv9acn$ckm$1@dough.gmane.org>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<1343760977-3290-6-git-send-email-raj.khem@gmail.com>
	<jv9acn$ckm$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 31 Jul 2012 12:24:21 -0700
X-Google-Sender-Auth: 9QJV_uNMNZksQAZp0msqPl1b_Qg
Message-ID: <CABcZANmBfJZQWqxjd5BZZTwNkoGSx3Nd9ns67aDD=i3_eJgjZw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH V2 6/7] blacklist.bbclass: Move to meta-angstrom
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
X-List-Received-Date: Tue, 31 Jul 2012 19:36:20 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 31, 2012 at 12:07 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Op 31-07-12 20:56, Khem Raj schreef:
>> This class is angstrom specific so lets move it to more appropriate
>> layer
>
> Ehm, it was put in meta-oe on request so other distros could use it.

A version of this with a different control interface is already in
oe-core. See oe-core/meta/classes/blacklist.bbclass.
-- 
Christopher Larson


