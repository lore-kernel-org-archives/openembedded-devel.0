Received: from [17.148.16.90] (helo=asmtpout015.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MGGSx-0002hK-HL
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Jun 2009 19:59:31 +0200
MIME-version: 1.0
Received: from [87.201.169.122] by asmtp015.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLA0032KK5JQB00@asmtp015.mac.com> for
	openembedded-devel@lists.openembedded.org; Mon,
	15 Jun 2009 10:49:00 -0700 (PDT)
Message-id: <9050EA3F-01E5-479A-8AF2-C6553F347FE7@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jun 2009 21:48:45 +0400
X-Mailer: Apple Mail (2.935.3)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: classpath_0.98 recipe failure
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
X-List-Received-Date: Mon, 15 Jun 2009 17:59:31 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi,
	I'm trying to build the classpath_0.98 recipe, but it doesn't work. I  
get a failure that is a really long list of java exceptions, to big to  
reproduce here. Here are the last few lines.

Could someone please help me resolve this error?

checking if javac - 
Xlint:unchecked,cast,divzero,empty,finally,overrides works...  
configure: error: The Java compiler javac - 
Xlint:unchecked,cast,divzero,empty,finally,overrides failed (see  
config.log, check the CLASSPATH?)
| FATAL: oe_runconf failed
NOTE: Task failed: /tool/overo-oe/tmp/work/armv7a-angstrom-linux- 
gnueabi/classpath-0.98-r0/temp/log.do_configure.14142
ERROR: TaskFailed event exception, aborting
ERROR: Build of /tool/overo-oe/org.openembedded.dev/recipes/classpath/ 
classpath_0.98.bb do_configure failed
ERROR: Task 6 (/tool/overo-oe/org.openembedded.dev/recipes/classpath/ 
classpath_0.98.bb, do_configure) failed
NOTE: Tasks Summary: Attempted 1703 tasks of which 1698 didn't need to  
be rerun and 1 failed.
ERROR: '/tool/overo-oe/org.openembedded.dev/recipes/classpath/ 
classpath_0.98.bb' failed


Best regards,

Elvis

