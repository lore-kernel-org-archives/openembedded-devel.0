Received: from dd12300.kasserver.com ([85.13.134.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <info@itPenguin.de>) id 1SXInB-0007BT-CU
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 May 2012 23:08:25 +0200
Received: from server.itpinguin.de (37-1-165-12.ip.skylogicnet.com
	[37.1.165.12])
	by dd12300.kasserver.com (Postfix) with ESMTPSA id C69FF420095
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2012 22:51:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by server.itpinguin.de (Postfix) with ESMTP id DEB0A176009
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2012 22:51:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at itpinguin.de
Received: from server.itpinguin.de ([127.0.0.1])
	by localhost (server.itpinguin.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XrrIm4yN+s4E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2012 22:51:25 +0200 (CEST)
Received: from [192.168.100.2] (troubadix.itpinguin.de [192.168.100.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server.itpinguin.de (Postfix) with ESMTPS id A40B0176008
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2012 22:51:25 +0200 (CEST)
Message-ID: <4FBD4DCD.3010505@itPenguin.de>
Date: Wed, 23 May 2012 22:51:25 +0200
From: info <info@itPenguin.de>
Organization: itPenguin GmbH
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: invalid base-passwd_3.5.20.bb
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
X-List-Received-Date: Wed, 23 May 2012 21:08:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Release 2011.3

At  ftp://ftp.debian.org/debian/pool/main/b/base-passwd/
these version is not available, so the building of all
images failes:
	base-passwd_3.5.20.tar.gz

verions 3.5.22 and 3.5.24 are available.

Please update the recipe.

Thank you, Roland


