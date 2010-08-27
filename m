Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Op0wY-0008OA-E1
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 17:34:14 +0200
Received: by gxk2 with SMTP id 2so1229976gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 08:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=ZjB0KFp3xpTmcTYFj57WEtErQesBNpZ8Mpu1Rgw09ew=;
	b=wO72WMra/JUI5uW8IJc4ihwSdDHVBUpRpm0lkN1v8U8K2ERKiyclLyr+tGDz/tp0Ms
	/tS676DDpA7Ml6v9prSs4gwH5w9MlFXJ49tYGsdUY6EqNljkIl7Jv5dM7TXbac6AAxKp
	S+ko0tyG0TzMAV4v2txln0Rgj0xCLkhXhDiuc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=gqu+3mbnO6Y+pckWpeC8jd9HM0zJfLjPmGmXAIWLEyveNUfyeXeCJ3sL9RvV4aZ+W/
	Cfqj5n5UCdqJYmfragrAVc6KrE/fsoHy96Pg57JPITODAKLA1y24OJXy3QSSh2g+eicO
	lJF1/cf7vefGCiYS1GUja+7ubPqIpRx3E1VJs=
Received: by 10.90.96.17 with SMTP id t17mr1923939agb.33.1282923224732; Fri,
	27 Aug 2010 08:33:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Fri, 27 Aug 2010 08:33:23 -0700 (PDT)
In-Reply-To: <AANLkTi=o=4pS4tLrhXErembiZ5j4ye+EzAk91yc02rya@mail.gmail.com>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>
	<i586bt$t12$1@dough.gmane.org>
	<AANLkTi=o=4pS4tLrhXErembiZ5j4ye+EzAk91yc02rya@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Aug 2010 08:33:23 -0700
Message-ID: <AANLkTi=oitWLGPS9UZRmufugcA10XGCacoWaoC9Tjocm@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Fri, 27 Aug 2010 15:34:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 27, 2010 at 5:13 AM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
>>> =A0recipes/udev/udev-compat141_141.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A06 ++-
>>
>> NAK
>>
>
> This one is an hack in progress, needed only for Zaurus until 2.6.36
> (hopefully).
> Please keep ;)

If you look at the patch then you will see that it only fixes this recipe
it does not move it to nonworking so no issues to worry about for Zaurus

>
> Andrea
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


