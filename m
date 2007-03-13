Received: from [192.132.34.13] (helo=amail.unina.it)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <ranaldo@unina.it>) id 1HRGUZ-0000G6-VS
	for openembedded-devel@openembedded.org; Wed, 14 Mar 2007 00:33:20 +0100
Received: from ops ([143.225.77.201]) (authenticated bits=0)
	by amail.unina.it (8.13.4/8.13.4) with ESMTP id l2DNXEp9012076
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 14 Mar 2007 00:33:19 +0100
From: Nicola Ranaldo <ranaldo@unina.it>
To: openembedded-devel@openembedded.org
Date: Wed, 14 Mar 2007 00:32:28 +0100
User-Agent: KMail/1.9.6
MIME-Version: 1.0
Message-Id: <200703140032.28661.ranaldo@unina.it>
Subject: OE and pakage builds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Mar 2007 23:33:20 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
i'm trying to fix and update qt library bb, while building and rebuilding 
packages i noted they dependes on the previuos compiled packages.
For example, if we build qt4 before glib, it is compiled without glib support.
So it my be that with the same tree we may produce different packages.
Is it a normal behaviour? should it be fixed?
in some message on the list i read oe builds should be deterministic.

Regards

	Niko


