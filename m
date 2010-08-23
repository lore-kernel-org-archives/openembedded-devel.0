Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OneWm-0000NS-3Q
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 23:26:01 +0200
Received: by fxm6 with SMTP id 6so3576863fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 14:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=1R2/LCyPujDcQjR+8xUOBb1zqG7kOdMOkRFlSCHE5tA=;
	b=CT7qhQUBNdT9cwogpa3xo/K+Ot22Y/ETQxN/0OS8J8oHagY8w5mPxesSK1z95nJrOr
	UAzf+TwnyIEiRFEf07cGN3XhgxpK6geIZB2bIEQOVdxeIhNks2+y79oe6WOaE/k/I5lH
	Y4TFfrEOrui2hRFReHrSEbkUgQGiOA+jBxUFM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=vHy6DLu7w/RGqAZH59I7DBpjCk7M7UkFomR3P9uqxYGheoElvV6txLosNWtNFq4ji2
	/JLecdTeIXlp7zq6lQ77dA6BQsf396ZnRG75bbdZDKHH16xeYRMWGMzPi2PaUFW8lEff
	P6gTUX/1CZt5DpTZLCMAs2Jtp/WiW5xcAGdyI=
Received: by 10.223.125.196 with SMTP id z4mr5025075far.80.1282598735142; Mon,
	23 Aug 2010 14:25:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.125.209 with HTTP; Mon, 23 Aug 2010 14:25:15 -0700 (PDT)
In-Reply-To: <1282556402.3853.17.camel@mattotaupa>
References: <1282198068-25415-1-git-send-email-coolaj86@gmail.com>
	<AANLkTi=bCxyXU+mubbmFcrtUsHiVsmtsDw0235E69XRd@mail.gmail.com>
	<1282556402.3853.17.camel@mattotaupa>
From: AJ ONeal <coolaj86@gmail.com>
Date: Mon, 23 Aug 2010 15:25:15 -0600
Message-ID: <AANLkTimWTfusnW2REvKOhH+vnjS=4EFrKV5DvDNOoYo5@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] added a .bb for node.js
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
X-List-Received-Date: Mon, 23 Aug 2010 21:26:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

>
> Please also remember to update the patch queue [2].
>

Update it to what?

That link you gave me is very unclear

It is desirable to update the state of the patch in the patch queue. This
> could also be added to the script.


The patch is listed as "new". I'd agree with that state. It certainly isn't
"accepted" - that's someone else's job to put that, right?

