Received: from gv-out-0910.google.com ([216.239.58.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thoughtmonster@gmail.com>) id 1NAqWW-0005QJ-1F
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 20:49:07 +0100
Received: by gv-out-0910.google.com with SMTP id e6so370222gvc.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 11:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=uONMT3R6gMHJuDY+0u17wUS9R0YfT0g5ksj3xcXVWAE=;
	b=D5jeSPyWHtZiM0CHuFxeryEW1ZpesOEHkNwQXzfLTvPA5h/QfBFJVdF2IusBH7S5pO
	fensHvq5G7PxlrlDf2U8HXMgPVM8cw2kYa65wjnIFhehQlAURB4U4RUXEV8+u6Rn3dhs
	UuLyz/DsZi+dZnV0r3eVq2b6+rjEBX0FJ+VTQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=PQuK4pajjBm7rUcPRXNDceVJc0ZHUKFWk8s9MLMEZ6W2hF/PmzwbD2OIC2Th4pra4h
	vmyA7ICySfseoo3Du32cmxBJxcEVVB3QA+ZdGEydMCP4stmXCDC1f0wvYjpm0ij+qozl
	8GkpYFmbPj1JRNoCLYV7Gi4YXOI9bSW2ZHSBo=
MIME-Version: 1.0
Received: by 10.239.130.28 with SMTP id 28mr1124388hbh.22.1258573661556; Wed, 
	18 Nov 2009 11:47:41 -0800 (PST)
In-Reply-To: <he1c7t$h1t$1@ger.gmane.org>
References: <992df8520911150534v4aeec248u91c5ca477de25eb9@mail.gmail.com>
	<992df8520911160511s4e641b28ya68dd6bd14f1101@mail.gmail.com>
	<992df8520911180812o76a71538o4095a8f08f95448@mail.gmail.com>
	<he1c7t$h1t$1@ger.gmane.org>
Date: Wed, 18 Nov 2009 21:47:41 +0200
Message-ID: <992df8520911181147x21f624b7p97b549f955c3c057@mail.gmail.com>
From: Alex Ferguson <thoughtmonster@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 216.239.58.187
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
X-List-Received-Date: Wed, 18 Nov 2009 19:49:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

I updated bug #5335 (http://bugs.openembedded.org/show_bug.cgi?id=5335) with
a new patch. Most userspace issues fixed, though a small issue with
xf86-input-tslib remains. Fixes are coming shortly.

