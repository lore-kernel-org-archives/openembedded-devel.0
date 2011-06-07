Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <guillaume.beraudo@gmail.com>) id 1QTvtb-0007JD-Ij
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Jun 2011 15:00:35 +0200
Received: by wwi18 with SMTP id 18so2350938wwi.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jun 2011 05:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:date:from:to:cc:subject:message-id
	:in-reply-to:references:organization:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=1iYZVlP/fez7LZZAmXQ9epDOKePbTCDXM8/7NhBq8oc=;
	b=q4JojwngMUiFa+VsEXWegICQxhOfUA0hWTdpBpuu9KRinxwId8CUUw/m1zAov8A58a
	rP8GZEJzlfcmTAmlLQvBWIYfria3AFPa3T9Ju7vN9Sbz8VUu+Att7vOHbDBeWuZhuf51
	TGmNEfeKfNINRjg3G8bhUhl9nPIU9VTHLHdkg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	b=RhS5RDMuWuvtOBstd2eJw9P6nDRGI+uVgptQbwL9VL6lpQZ1BU4JiR7ASJAfHGG2dZ
	IyEfCv0y5w8VvipOBRtQN0BNprl5vKVcrF4rn3pqjNaXlQ2Z/+gjVcgHfAsl9uQYj+Ez
	gOqUhU9ktqtKqq/mk1yXOv23wkyGWAMm7zbE0=
Received: by 10.216.201.163 with SMTP id b35mr6015133weo.80.1307451438338;
	Tue, 07 Jun 2011 05:57:18 -0700 (PDT)
Received: from guibc (vig38-2-81-56-113-2.fbx.proxad.net [81.56.113.2])
	by mx.google.com with ESMTPS id h22sm2852071wes.32.2011.06.07.05.57.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 05:57:17 -0700 (PDT)
Sender: guillaume beraudo <guillaume.beraudo@gmail.com>
Date: Tue, 7 Jun 2011 14:57:13 +0200
From: Guillaume BERAUDO <guillaume.beraudo@belledonne-communications.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110607145713.4ff067a0@guibc>
In-Reply-To: <20110607124151.GA23137@jama.jama.net>
References: <guillaume.beraudo@belledonne-communications.com>
	<1307448812-27299-1-git-send-email-guillaume.beraudo@belledonne-communications.com>
	<20110607124151.GA23137@jama.jama.net>
Organization: Belledonne Communications
X-Mailer: Claws Mail 3.7.6 (GTK+ 2.20.1; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: martin.jansa@gmail.com
Subject: Re: [PATCH] linphone: added recipe for v3.4.3
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
X-List-Received-Date: Tue, 07 Jun 2011 13:00:35 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Martin,

> the 2 patches in linphone-3.1.0 look self-explanatory, are they
> applied upstream?
The doc patch seems long ago obsolete.
I don't see any "ENABLE_GTK_DOC" in configure file.

The b64 is cryptic to me, could you explain it?


