Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1P8xy7-00082y-Tu
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 18:26:21 +0200
Received: by qyk10 with SMTP id 10so2255769qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 09:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=nG4xwCAgWCinELsAPZzXXNiH/ib6Yonx9coUfmJE0LM=;
	b=SsCSHKYk2ubu66/JgopCEQpHs//qL4lC0n7GWzFwnA1GZUkGcZhiPgbOSypLsW0/gq
	AU+Wir9lOuTdX8UxazJe9fo4PUca/V7geQf7X7m086UKKImBoZb7tG94kUp7rHdJy+7F
	72c0BzAiGBuCO+8PHzHqyJ2gxn+V9cK57VWVY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=aNlprc61klAHpMpHC0zSTfQfF+e3fOOFCICc8LukJ3qB+cDYv81ApwKQrY9ypm9Q9j
	bzVZHn7yCt4XDwnfV/2S650QTHLzmkYXyCwpaAtzseB8S6XrdO6HDOqkyzr6ixDu5ugI
	vwnmgtVXPZAHTDoQVoV8JL/NaaStzIQ8fzDCg=
Received: by 10.102.215.17 with SMTP id n17mr1823264mug.99.1287678216803; Thu,
	21 Oct 2010 09:23:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.112.201 with HTTP; Thu, 21 Oct 2010 09:19:32 -0700 (PDT)
From: AJ ONeal <coolaj86@gmail.com>
Date: Thu, 21 Oct 2010 10:19:32 -0600
Message-ID: <AANLkTinopf3q+cmP5hi7sg0R0j5xyEE4pOLNzkw-yrz=@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: bitbake monit fails "missing argument to --host-alias"
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
X-List-Received-Date: Thu, 21 Oct 2010 16:26:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

NOTE: Executing runqueue
NOTE: Running task 388 of 607 (ID: 11,
/home/coolaj86/overo-oe/user.collection/recipes/monit/monit_5.1.1.bb,
do_configure)
ERROR: function do_configure failed
ERROR: log data follows
(/home/coolaj86/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/monit-5.1.1-r0/temp/log.do_configure.18244)
| configure: error: missing argument to --host-alias
NOTE: Task failed:
/home/coolaj86/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/monit-5.1.1-r0/temp/log.do_configure.18244
ERROR: TaskFailed event exception, aborting


AJ ONeal

