Received: from smtp-out.google.com ([216.239.44.51])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <alees@google.com>) id 1OVyw2-0001F7-08
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jul 2010 05:35:21 +0200
Received: from kpbe11.cbf.corp.google.com (kpbe11.cbf.corp.google.com
	[172.25.105.75]) by smtp-out.google.com with ESMTP id o663U2hb017075
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 5 Jul 2010 20:30:02 -0700
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=google.com; s=beta;
	t=1278387002; bh=qDTuGo76GCI3HIGONCcpFSrUy40=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type;
	b=DTX9WYVSpIEHPw8fZSKiifLawNTEFhStxevQmlwL37MsZzbAe8y8TkGzX3V2Qdhel
	PYP1PUfDh4I5XN/G4w2EQ==
DomainKey-Signature: a=rsa-sha1; s=beta; d=google.com; c=nofws; q=dns;
	h=mime-version:from:date:message-id:subject:to:content-type:x-system-of-record;
	b=GQxgnvFhW5ZU+PjkctVXQsdzEKbRM7Wf8Q2eEixV9z6Hb2SOXGRNXWUt+hfHf0vff
	hJ7d/CQsmANdQEsoGR+og==
Received: from vws3 (vws3.prod.google.com [10.241.21.131])
	by kpbe11.cbf.corp.google.com with ESMTP id o663U0g7014192
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 5 Jul 2010 20:30:01 -0700
Received: by vws3 with SMTP id 3so4345171vws.34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jul 2010 20:30:00 -0700 (PDT)
Received: by 10.220.168.12 with SMTP id s12mr2036924vcy.240.1278386999364; 
	Mon, 05 Jul 2010 20:29:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.83.97 with HTTP; Mon, 5 Jul 2010 20:29:39 -0700 (PDT)
From: Angus Lees <alees@google.com>
Date: Tue, 6 Jul 2010 13:29:39 +1000
Message-ID: <AANLkTinadOzl08k8hENqZJf9fMzcHHCnpUP1DfmatDj7@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-System-Of-Record: true
X-SA-Exim-Connect-IP: 216.239.44.51
X-SA-Exim-Mail-From: alees@google.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: canadian-cross sdk?
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
X-List-Received-Date: Tue, 06 Jul 2010 03:35:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

I have an SDK built for my OS using dev-OE - and it works well.  I'd like to
build an SDK for another host OS (in particular cygwin if that is possible),
but I'm lost in a twisty maze of canadian-sdk classes that all seem to be
deprecated and/or unused.

Which of the canadian-cross options is the recommended approach atm?  How do
I use it?

 - Gus

