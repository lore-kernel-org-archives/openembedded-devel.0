Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cdhmanning@gmail.com>) id 1PwmyS-0004T1-J1
	for Openembedded-devel@lists.openembedded.org;
	Tue, 08 Mar 2011 03:48:36 +0100
Received: by fxm8 with SMTP id 8so4755669fxm.6
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 07 Mar 2011 18:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=f6TMZcByjpFYph++/dvZ+xIK/tla/JS5bx+2tZCEElE=;
	b=SgymeaGfXwpBTXZCFvJXCkzNZ/6vWcen0ix5qpYB4rl0VI3pkpXmbqYpV/5AjpreZd
	5dlfb+5QlmebO20focAyopIWkFK3uEQchitX+NesWd96YRzS4gzIkW07OdSvf+qbQPTm
	LPznTWHCgC43CR3/wfFdBQT/bSrnIr7aGhEv4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=m11tlkfqSNa5uxJ50q0G3zLjl1IaAQOQfkhbQEtGEX845oRe3EJKq/milrZUfVN6a4
	2qpJKJSeL7l0R2OllP3S0TLnvTPaHUGHHDys2IhxYNOrNTD6oqRJA+M2lca1IlP52PMg
	ELdcXCYNmpDQkURU0qFPdfjBusWAfTUAdJvfk=
MIME-Version: 1.0
Received: by 10.223.54.213 with SMTP id r21mr3454274fag.54.1299552421504; Mon,
	07 Mar 2011 18:47:01 -0800 (PST)
Received: by 10.223.151.6 with HTTP; Mon, 7 Mar 2011 18:47:01 -0800 (PST)
Date: Tue, 8 Mar 2011 15:47:01 +1300
Message-ID: <AANLkTik9UybhDf+RjdLcm-TBjiT6Ur36sDoyoA4VX65m@mail.gmail.com>
From: Charles Manning <cdhmanning@gmail.com>
To: Openembedded-devel@lists.openembedded.org
Subject: What does PACKAGES_DYNAMIC do?
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
X-List-Received-Date: Tue, 08 Mar 2011 02:48:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

What is the rationale behind PACKAGES_DYNAMIC.

I tried to RTFM, but that's in one of the Todo sections :-(.


