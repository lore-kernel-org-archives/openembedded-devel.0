Received: from [17.148.16.89] (helo=asmtpout014.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MDFFN-000074-9N
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 12:05:01 +0200
MIME-version: 1.0
Received: from [87.201.169.74] by asmtp014.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KKV00CVC4WLB810@asmtp014.mac.com> for
	openembedded-devel@lists.openembedded.org; Sun,
	07 Jun 2009 02:55:37 -0700 (PDT)
Message-id: <A4769874-EA1D-486F-AC63-B77CADCE4DBF@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>,
	Steve Sakoman <sakoman@gmail.com>
In-reply-to: <4E17E8CF-AA3B-4929-BC22-B9B28A757035@mac.com>
Date: Sun, 07 Jun 2009 13:55:29 +0400
References: <4E17E8CF-AA3B-4929-BC22-B9B28A757035@mac.com>
X-Mailer: Apple Mail (2.935.3)
Subject: Error: latest linux-omap3_git.bb doesn't work
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
X-List-Received-Date: Sun, 07 Jun 2009 10:05:01 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi,
	The linux-omap3_git.bb recipe in the org.openembedded.dev repository  
doesnt work.

I re-cloned the entire org.openembedded.dev repository, commented out  
the DEFAULT_PREFERENCE="-1" in the linux-omap3_git.bb file, and ran  
the bitbake linux-omap3 command.

I get a fatal error not a git repository.

Elvis





