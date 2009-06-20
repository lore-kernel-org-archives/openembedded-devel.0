Received: from [17.148.16.86] (helo=asmtpout011.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MI5SN-00040H-2e
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Jun 2009 20:38:27 +0200
MIME-version: 1.0
Received: from [87.201.169.152] by asmtp011.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLJ00LAFV9ZZZ50@asmtp011.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	20 Jun 2009 11:27:39 -0700 (PDT)
Message-id: <3186A9DE-F7A1-4400-8B6B-ABE119EDA16A@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <1245521341.29153.288.camel@lenovo.internal.reciva.com>
Date: Sat, 20 Jun 2009 22:27:20 +0400
References: <B7B72D38-62FD-4B6B-9856-DF4F470F832F@mac.com>
	<1245521341.29153.288.camel@lenovo.internal.reciva.com>
X-Mailer: Apple Mail (2.935.3)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Recipe for libserial_0.6.0rc1
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
X-List-Received-Date: Sat, 20 Jun 2009 18:38:27 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7BIT

Hi Phil,

On Jun 20, 2009, at 10:09 PM, Phil Blundell wrote:

> Try:
>
> do_compile() {
> 	oe_runmake SUBDIRS="src doc examples"
> }

It compiled all the files in src, doc and example, and then went  
looking for another sub dir called src.

Elvis



