Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OM0sc-0007a8-Bs
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 17:38:19 +0200
Received: by fxm9 with SMTP id 9so3139992fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jun 2010 08:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=/v3Er+j7VmGuDYBpl1ZxK41BtvtUYzet5eoyLuN/V68=;
	b=wJQ4f5VQXWKZd0CbXQ66HBYBNsCjwZLrHgDxfgFi2SfJQ9PjCfoZC5XMg9C+o1LcBj
	SGr+rQjvCmvlQO8h4lKFdDgEMGZwqv3/jAXF3gCzxEC6S9mnv2gMCDz1DxT9RUAdPgBk
	1liGWvMv0HY0Blw7g1hFSCMg6/7gIbsSJulNY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=UhUo6day96kcz2iy/HLjqAJ+0kPDTUaBwUXWJEwSRM8Kj8r+70gEPOS/othSM2opfR
	kByishQWRlvXL6M1BlO6wYWkW/m2r3ZjcDxlYocTV9l0d+4X4mDvO9VGgklxZhyAjloS
	gCYlyXfbQ3LHs8K8I3Plc3akLjUcW88ovxAx0=
MIME-Version: 1.0
Received: by 10.204.81.14 with SMTP id v14mr7860124bkk.105.1276011237182; Tue, 
	08 Jun 2010 08:33:57 -0700 (PDT)
Received: by 10.204.54.137 with HTTP; Tue, 8 Jun 2010 08:33:57 -0700 (PDT)
In-Reply-To: <AANLkTimze8vRUUloa6gaRBU6jvp8zrcSAKDvqCu3ppaY@mail.gmail.com>
References: <AANLkTil89_7H3CIZOSZd9QjKE-Cf6mv5B7xpFCqaM8oM@mail.gmail.com>
	<1273859746.22943.454.camel@trini-m4400>
	<AANLkTimDt7fVT14jNofov1ESwO2M_CvBAe6RsdvzZicE@mail.gmail.com>
	<1273881865.8005.205.camel@trini-m4400>
	<1274035921.24454.68.camel@rex>
	<AANLkTimze8vRUUloa6gaRBU6jvp8zrcSAKDvqCu3ppaY@mail.gmail.com>
Date: Tue, 8 Jun 2010 17:33:57 +0200
Message-ID: <AANLkTinQkOqz64zpVuPA_OTRJ9O3ujjMv77DIUInHFWa@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Issues with parallel build? (Was: gtk+native missing dep ?)
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
X-List-Received-Date: Tue, 08 Jun 2010 15:38:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

Bump: issue seems still present :/

Don't know how related/unrelated but on @beagle irc I spotted this bits:

[17:06]	<gst-kaps1>	On Angstrom, gst-inspect doesnt work
[17:07]	<gst-kaps1>	it says g_malloc_n symbol not found ?

[17:10]	<ant_work>	gst-kaps1: interesting. Have you had any build-issue?
[17:11]	<gst-kaps1>	ant_work: no


Andrea


