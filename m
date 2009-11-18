Received: from mail-qy0-f181.google.com ([209.85.221.181])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thoughtmonster@gmail.com>) id 1NAnAI-0003SA-2E
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 17:13:57 +0100
Received: by qyk11 with SMTP id 11so676234qyk.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 08:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=KTc6Xw84K1ovzfIEDYuHhhOIiSahFbqJKaQlE/46AeU=;
	b=aSwT+/6qqMvl/sVxev3BI/CLJ/IQCTDFJEDtuPlNJ1BkYfjtJ1lSXuoytj2R/ew3AB
	str+D6jkQBN8xWgAIed17aWQmlXHKak5SXb3I4V4oi9UrOuSmrfjSDIimENUgqaWhVtI
	Kil29IY12c7tShHWK2mE02yf86k/jI9T2SGcA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=XhrW5khE/90QAHHQYa7RCybW25SqZ6frqeB11BWTR7C6eUngvSfo/SVAoRkqL+Pa1f
	voIcgOQOSXuJZIT3bvsU1oOBOpuMMIsT5nryaA4Mp34Mb5QcP4sCbejsYHKJYEIPRN2I
	EdgUId6igDYKr6m/bLLex9U8j5g/qFDzhTSQk=
MIME-Version: 1.0
Received: by 10.239.179.99 with SMTP id c35mr1092424hbg.197.1258560748752; 
	Wed, 18 Nov 2009 08:12:28 -0800 (PST)
In-Reply-To: <992df8520911160511s4e641b28ya68dd6bd14f1101@mail.gmail.com>
References: <992df8520911150534v4aeec248u91c5ca477de25eb9@mail.gmail.com>
	<992df8520911160511s4e641b28ya68dd6bd14f1101@mail.gmail.com>
Date: Wed, 18 Nov 2009 18:12:28 +0200
Message-ID: <992df8520911180812o76a71538o4095a8f08f95448@mail.gmail.com>
From: Alex Ferguson <thoughtmonster@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.181
X-SA-Exim-Mail-From: thoughtmonster@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Initial Support for the Samsung Omnia (SGH-i900)
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
X-List-Received-Date: Wed, 18 Nov 2009 16:13:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

I fixed the firmware issues and have made the firmware available externally.
I'll test and upload the machine config along with the kernel, and a couple
of support files for tslib and pointercal.

Koen: Would a do_install_append_sgh-i900() function do?

