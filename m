Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L6DZw-0008Um-Nb
	for openembedded-devel@openembedded.org; Sat, 29 Nov 2008 01:20:56 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L6DWp-0004hJ-Fq
	for openembedded-devel@openembedded.org; Sat, 29 Nov 2008 00:17:43 +0000
Received: from ppp89-110-22-67.pppoe.avangarddsl.ru ([89.110.22.67])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 29 Nov 2008 00:17:43 +0000
Received: from dbaryshkov by ppp89-110-22-67.pppoe.avangarddsl.ru with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 29 Nov 2008 00:17:43 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Sat, 29 Nov 2008 00:17:37 +0000 (UTC)
Message-ID: <ggq1n1$85a$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ppp89-110-22-67.pppoe.avangarddsl.ru
User-Agent: Pan/0.132 (Waxed in Black)
Sender: news <news@ger.gmane.org>
Subject: packaging question
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
X-List-Received-Date: Sat, 29 Nov 2008 00:20:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

To make suspend work on tosa w/o problems, I have to put several files into
apm hooks directories. The question is: into which OE package should I put them?

-- 
With best wishes
Dmitry




