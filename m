Received: from [213.160.40.50] (helo=popeye1.ggamaur.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roger@bufferoverflow.ch>) id 1JaEAn-00085l-A0
	for openembedded-devel@openembedded.org; Fri, 14 Mar 2008 18:58:36 +0100
Received: from automat.bufferoverflow.ch (c-82-192-224-61.customer.ggaweb.ch
	[82.192.224.61])
	by popeye1.ggamaur.net (8.13.7/8.13.7/Submit) with ESMTP id
	m2EHu95m045835 for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2008 18:56:10 +0100 (CET)
	(envelope-from roger@bufferoverflow.ch)
Received: by automat.bufferoverflow.ch (Postfix, from userid 33)
	id B159DF3F4; Fri, 14 Mar 2008 18:55:30 +0100 (CET)
Received: from 194.56.133.3 ([194.56.133.3]) by www.bufferoverflow.ch
	(Horde MIME library) with HTTP; Fri, 14 Mar 2008 18:55:30 +0100
Message-ID: <20080314185530.bpxvumogsowc0s80@www.bufferoverflow.ch>
X-Priority: 3 (Normal)
Date: Fri, 14 Mar 2008 18:55:30 +0100
From: Roger Meier <roger@bufferoverflow.ch>
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.1.3)
X-Scanned-By: MIMEDefang 2.62 on 213.160.40.60
X-SA-Exim-Connect-IP: 213.160.40.50
X-SA-Exim-Mail-From: roger@bufferoverflow.ch
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH]add missing backtrace support to arm gcc 4.1.2
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
X-List-Received-Date: Fri, 14 Mar 2008 17:58:36 -0000
Content-Type: text/plain;
	charset=UTF-8;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Do you like backtrace ? => that patch is for you!
<http://www.gnu.org/software/libtool/manual/libc/Backtraces.html>

get it: http://bugs.openembedded.org/show_bug.cgi?id=4072

greetings
roger


further information about the patch is here available:
<http://sources.redhat.com/ml/libc-ports/2006-06/msg00045.html>
<http://gcc.gnu.org/ml/gcc-patches/2006-06/msg00357.html>


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.



