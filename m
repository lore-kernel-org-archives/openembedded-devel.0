Received: from [209.85.128.184] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1JaVkA-0002Bm-Tt
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Mar 2008 13:44:12 +0100
Received: by fk-out-0910.google.com with SMTP id 18so5361764fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2008 05:41:49 -0700 (PDT)
Received: by 10.78.168.6 with SMTP id q6mr34840063hue.65.1205584909097;
	Sat, 15 Mar 2008 05:41:49 -0700 (PDT)
Received: by 10.78.81.13 with HTTP; Sat, 15 Mar 2008 05:41:49 -0700 (PDT)
Message-ID: <d2b9ea600803150541r2bcc01a8y800ea3da5e72641d@mail.gmail.com>
Date: Sat, 15 Mar 2008 13:41:49 +0100
From: "Esben Haabendal" <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20080314185530.bpxvumogsowc0s80@www.bufferoverflow.ch>
MIME-Version: 1.0
References: <20080314185530.bpxvumogsowc0s80@www.bufferoverflow.ch>
X-SA-Exim-Connect-IP: 209.85.128.184
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=HTML_MESSAGE,RDNS_NONE
	autolearn=no version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: [PATCH]add missing backtrace support to arm gcc 4.1.2
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
X-List-Received-Date: Sat, 15 Mar 2008 12:44:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Mar 14, 2008 at 6:55 PM, Roger Meier <roger@bufferoverflow.ch>
wrote:

> Do you like backtrace ? => that patch is for you!
> <http://www.gnu.org/software/libtool/manual/libc/Backtraces.html>
> get it: http://bugs.openembedded.org/show_bug.cgi?id=4072
>

Is this patch valid for all architectures, not just ARM?

/Esben


> greetings roger
>
> further information about the patch is here available:
> <http://sources.redhat.com/ml/libc-ports/2006-06/msg00045.html>
> <http://gcc.gnu.org/ml/gcc-patches/2006-06/msg00357.html>
>

