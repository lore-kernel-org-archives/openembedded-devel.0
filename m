Received: from [209.85.220.220] (helo=mail-fx0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LzRub-0008MR-AU
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Apr 2009 10:46:33 +0200
Received: by fxm20 with SMTP id 20so2107067fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Apr 2009 01:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=HAoKbEOLpTxUgwDtG45AL3qPY8nHcu7av4CZ47TGsA8=;
	b=fjukJ2NyBKK2kIBr+zoa+66M+/mFwMxmHNNAkTaDjKFigLjgm/eke9L2KujF3s75wu
	5hn0Ta07d5OMtN69MUETEz0oZj0QaRqYUoZ7wdhBkmbHHJuZh2wtP5P7yii51ozWjXlo
	XaxzX/G5CXMtT2UaoAQ6gTXS8+NSvF9+arcdo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=jfPrQrsp3n5icopahQnzU6EJEZTe/vEooOB1ilUnlFPdkOecBTTd09ZIpzmKDzCDtr
	D9TqGYeaGWyHceOM+rekfAxRB0ASkpRUAQ0KEfmUTjtACXvrmSkeZe3SGEEq6JuEW0oy
	20f66oAKJnG5GoCxZRLvfr0khrLTIw4toEH2w=
MIME-Version: 1.0
Received: by 10.223.110.200 with SMTP id o8mr584693fap.56.1241080870912; Thu, 
	30 Apr 2009 01:41:10 -0700 (PDT)
Date: Thu, 30 Apr 2009 10:41:10 +0200
Message-ID: <d1b08f940904300141v5a0ce7b7pdf78d5f8918280f3@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Tinderbox timestamps?
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
X-List-Received-Date: Thu, 30 Apr 2009 08:46:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I'm following the build from scratch identified as 2009-04-30
08:43:01.108367 and I see something definitely strange with the
timestamps:

First package built is
2009-04-30 08:45:26.945632 shasum-native

..all fine...but the last packages appear built in the future!
2009-04-30 18:20:16.835303 libgpg-error


http://tinderbox.openembedded.net/builds/146342/

This also messes the ordering of the builds.

Regards

Andrea


