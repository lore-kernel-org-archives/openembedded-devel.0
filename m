Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dallas.a.clement@gmail.com>) id 1SgnHD-0000Z3-Dr
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jun 2012 03:30:39 +0200
Received: by wibhi8 with SMTP id hi8so77794wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2012 18:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=SCXSehj+SNhtW779bmf1cqoQO8FaXNGuf5Q3HyTKAZk=;
	b=e4VJSXSBScfTX2Uh09KdS5e0dNWGbZePy8YeUTxq9wDM/MfLzEOfP2xRO1D2as4QgR
	amaHc6wg4GLe6uATxbyRPN6YjSfUY9gU1xyxxF0keCKGm9h7/dV6MAFNAGBmJ+TDf5d3
	jbUwioUulkoPGBgJRjrL5DfWV8AZGVx+f9dl/ZsHiksmEQwkTeL+MWChe8y26O2YE2Ag
	6T/YbHpQ5vPmqyZFaHrUmujltvY/Uj+PzT6RdoydqA6jqPkvs0iMd4+B+ksWakb0Cwic
	FjBL4wI35MBUMow6zg9y2dey/CRNIdxGvI1ftQBVQtARIy4E2RvZz8wVVrm3W2HU1Lco
	txdw==
MIME-Version: 1.0
Received: by 10.180.98.201 with SMTP id ek9mr28235265wib.7.1340068796671; Mon,
	18 Jun 2012 18:19:56 -0700 (PDT)
Received: by 10.180.14.193 with HTTP; Mon, 18 Jun 2012 18:19:56 -0700 (PDT)
In-Reply-To: <7888297.NxAaM4fFbI@pink>
References: <CAE9DZUTckmmxoW_kdKksyT7tq86zV-AacJGwrEqpCFh+vBZYFw@mail.gmail.com>
	<7888297.NxAaM4fFbI@pink>
Date: Mon, 18 Jun 2012 20:19:56 -0500
Message-ID: <CAE9DZUTUaNOBWyEFJxfYK5YpXN_C4Zh_o=qo-Vt4XyS89_Nn_Q@mail.gmail.com>
From: Dallas Clement <dallas.a.clement@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Package selection
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
X-List-Received-Date: Tue, 19 Jun 2012 01:30:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks all for the tips!  I got quite a bit further by trying oe-core
instead of the oe-classic I was using.  Was able to build a minimal
system and run in qemu for x86-64.


