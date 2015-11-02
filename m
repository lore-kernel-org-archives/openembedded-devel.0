Return-Path: <gurrieristefano@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 670C960125
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Nov 2015 10:14:13 +0000 (UTC)
Received: by iodd200 with SMTP id d200so138688601iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Nov 2015 02:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Qfw/y89CzUH4jYWL1m5R01iW9mEK1Gssf3ziMt/gvHk=;
	b=0ruVI2YWx6czxYoFewxPqp8mJWci6J3hRnHf/nskL+80Rs85zR6fDJshtVZaB6su4s
	AnUTQ15l2ntBO93mfSFxEXAgMRZT+jZ8dCUE2ZU2SXRKCsBM707cy/SgQ4AO5seeToTy
	KONNlCx+Qoe6f+hEGIavJc76nCEL1gXrxsjVH9iZxBJYY4BM7VV354XKEgyYZkeWkQK5
	XlKbFIgdezEi7fOFZbu80CknT34hezaxbWCwzp8BZuYzzkvPynzOdDaf9+JW8i7Xp/xa
	Iqjx+053CpDpzRhXZw1cALTy8Y3Ek1u6HJVTei3ikwoXkC9bwcY26U+cXlqQHaWGI/rs
	Zz8Q==
MIME-Version: 1.0
X-Received: by 10.107.135.95 with SMTP id j92mr19925495iod.148.1446459253863; 
	Mon, 02 Nov 2015 02:14:13 -0800 (PST)
Received: by 10.107.192.5 with HTTP; Mon, 2 Nov 2015 02:14:13 -0800 (PST)
Date: Mon, 2 Nov 2015 11:14:13 +0100
Message-ID: <CAKpvFF1iKmibZaEh8FGDLrkR7sSbWkVfNxu_oddq89PUYchehA@mail.gmail.com>
From: Stefano Gurrieri <gurrieristefano@gmail.com>
To: openembedded-devel@lists.openembedded.org, interest@qt-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: meta-qt5 (fido) in my yocto project (dizzy)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Nov 2015 10:14:14 -0000
Content-Type: text/plain; charset=UTF-8

Hi people,
I'd like to use meta-qt5 layer (downloaded from fido branch) in my yocto
project that is a dizzy.

Is it possible?

I'd like use an update qt version (5.4 included in fido branch) instead of
5.3 (include in dizzy branch).

Thanks a lot for the help.
Greetings,
Stefano

