Received: from mail-vb0-f51.google.com ([209.85.212.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <errordeveloper@gmail.com>) id 1UVIfi-0004h8-S4
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Apr 2013 11:41:01 +0200
Received: by mail-vb0-f51.google.com with SMTP id x19so2443971vbf.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Apr 2013 02:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=lb0fBTYhSKCJ6EdUZAb5zGWuD8IFTxW73QNRlzgZniA=;
	b=Z1wXv0DcEPak8ygmf+Dq43MNELt1CfeQAFH3Z9MmsSpyuguFRDY9FQufnyCUz+j+uy
	uF9osbSUNS9bZ8RX2vm90oxWsiITn6uVVsCCZ75dIjlIwZf3U5+uMqS6gtZdgQ1+geuK
	jzXy38Vp4J8z9nVhEwa4ktZvAs/cBXPIgUZRY4Xj8MjFG9627zVxz9caiAWl6yub8W5I
	opnTlMKr2vcw/EZsf6ZtRDFiQZ2UdocqRqatPG+jMSN8r3BMsAs3zbFWgBwdnd14Kw9K
	wKHG06uLwNYnIYTogPc/IRQYKqyexGjnHc7WID4Qh01fhil8m1WUImjaI9R/fuBgICW1
	97Jw==
MIME-Version: 1.0
X-Received: by 10.220.168.202 with SMTP id v10mr26505025vcy.71.1366881795445; 
	Thu, 25 Apr 2013 02:23:15 -0700 (PDT)
Received: by 10.59.7.197 with HTTP; Thu, 25 Apr 2013 02:23:15 -0700 (PDT)
Date: Thu, 25 Apr 2013 10:23:15 +0100
Message-ID: <CAPhDKbH2fR4nDdGKU7SmsP79x7kxMRRS1068yvOJPWu7eD6ifg@mail.gmail.com>
From: Ilya Dmitrichenko <errordeveloper@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC] python-requests recipe pull-request
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
X-List-Received-Date: Thu, 25 Apr 2013 09:41:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi List,

I have submitted this pull-request via github:

https://github.com/openembedded/meta-oe/pull/12

Can anyone take a look and comment on my questions?

Reagards,
-- 
Ilya


