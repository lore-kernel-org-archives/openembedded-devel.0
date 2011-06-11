Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rizwancodes@gmail.com>) id 1QVMiU-0000H7-Qv
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Jun 2011 13:51:02 +0200
Received: by iwn19 with SMTP id 19so1085682iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jun 2011 04:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=9nqCgrDkUiUVZCwMAsibNP8AeMR6y8pWyYGSIafy76Y=;
	b=J3tJQn+EfZ+8NBebX/snFoV3FuHehNp+YA+BWPJqbNv+cFQJBtzMqfrnyg72jXVZbU
	vBUxnaNng4FROg7OQIQdei6iallR8DN65rJK+NDH+M7dviY0GKYXwkaLwYLkPO/7i6+L
	O65MU935xDpRnOPXvItsb9i0dnKGLc1DLpnuw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=plMBbedLQoez2rQ1HRbaGEyBDpsZvbGjBp6TCz1lp6GpaH8JS4loqm8hx7rTXpOFRv
	Wr2qixbOt9SHQz/RuTFAqfvleme/gwq4NGcAgToeIA/BO+iPAC665q54aKmbMrqfvUly
	60Ilw3QxhNOub8zO8M/SXJAZkE2GUzkLGGlIY=
MIME-Version: 1.0
Received: by 10.43.54.146 with SMTP id vu18mr3808013icb.296.1307792856666;
	Sat, 11 Jun 2011 04:47:36 -0700 (PDT)
Received: by 10.42.80.75 with HTTP; Sat, 11 Jun 2011 04:47:36 -0700 (PDT)
Date: Sat, 11 Jun 2011 17:17:36 +0530
Message-ID: <BANLkTimZyhdvFmUpRnfazze6RcKp9KEswg@mail.gmail.com>
From: Rizwan Shaik <rizwancodes@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Issue of unable to unmount USB
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
X-List-Received-Date: Sat, 11 Jun 2011 11:51:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I am facing an issue of not able to unmount the USB device after attaching
it to my alioth board.
Getting the error as below.
                       org.freedesktop.Hal.Device.volume.Unknown Failure
                         Can not open /media/.hal-mtab
"unmount" through command line is working fine.


Please help me.

Thanks in advance.

