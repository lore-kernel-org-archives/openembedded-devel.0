Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RfHHO-0006i5-LA
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Dec 2011 21:36:18 +0100
Received: by vcbf1 with SMTP id f1so8132226vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Dec 2011 12:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=rnxgXm8Mlt39A4fdoy66GdjTVnzh4PDWCZtQ6+rQzdA=;
	b=CjdnpD3fR7lwuzTFU6d0gZ+ghoDNCIkm7r2pMKNR4zYSasK7lvKNzVBPt/p4/96yvt
	VgjwGkB93dCu1f5GmwTbwuWt2x70+AKPtc0hARWJJ6U/UGEQ1VWy6FH6UNzocpb636v4
	w24gelws9oBITxEfkobqliEXWA+r95fCjWeec=
MIME-Version: 1.0
Received: by 10.220.232.9 with SMTP id js9mr14957601vcb.55.1324931346940; Mon,
	26 Dec 2011 12:29:06 -0800 (PST)
Received: by 10.52.160.137 with HTTP; Mon, 26 Dec 2011 12:29:06 -0800 (PST)
Date: Mon, 26 Dec 2011 21:29:06 +0100
Message-ID: <CACW_hTbaEcTcwhut+9NJX6yci6Mu6w+uhqB3xKcfORSg5gM2FA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [2011.03-maintenance] net-snmp: please cherry pick 4a98e62ac35d4367d3c072819317deeda52abf5e from master
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
X-List-Received-Date: Mon, 26 Dec 2011 20:36:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

Please merge this one
http://cgit.openembedded.org/openembedded/commit/?id=4a98e62ac35d4367d3c072819317deeda52abf5e

to the maintenance tree. it updates net-snmp to 5.7.1; the existing version
does not build for uclibc; this fixes it.

Thanks, Frans

