Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tdno7-0003HB-Mv
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2012 21:00:32 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so7482551pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2012 11:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=2Y4oc9OGfhe0TlgthhW6c901sSquCFUSz0JmPFoDBcQ=;
	b=aNcaG4sQlQsnP31rrVtcIL0ABcnKl2eo5OdO4esSQoZINaENKBw1ztcGkSoxCGPxJm
	5hMVxC6HODNk59HEOsEyIfQJ1f2LJ5q2ZGQRL+Od7NKT82pUSjXUdVuxYD5KcCTtLXUr
	ATq4cfM6KyqMStfIKvpO3FtxmQ4XMRMKWvwvULWU0g3TtmpJteP5y/VQgMD+N2TqufNX
	rY9DN3fC9qrS98+OZIf5AqobrwYx4g+G/gzd2z/zLG2CwPukucPNn9PKHp4zPe3lK5N1
	/Ai2nqqhuTAabjOyh02HTN0VHEV4Y3x8aeePgXVYCin082xgNowMpqCML/rtnQYdpogE
	RdEw==
MIME-Version: 1.0
Received: by 10.66.81.198 with SMTP id c6mr44632379pay.50.1354131976327; Wed,
	28 Nov 2012 11:46:16 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Wed, 28 Nov 2012 11:46:16 -0800 (PST)
In-Reply-To: <1354131040-9077-6-git-send-email-mario@ossystems.com.br>
References: <1354131040-9077-1-git-send-email-mario@ossystems.com.br>
	<1354131040-9077-6-git-send-email-mario@ossystems.com.br>
Date: Wed, 28 Nov 2012 17:46:16 -0200
X-Google-Sender-Auth: WRgIJHMkLBzty88_uAkK8djjAFg
Message-ID: <CAP9ODKpgn6Qg5GoSPud=JK69pSVQ8WzTfghKUccoygFMe695wg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 6/6] samba: split winbind into winbind and libwinbind
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
X-List-Received-Date: Wed, 28 Nov 2012 20:00:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 28, 2012 at 5:30 PM, Mario Domenech Goulart
<mario@ossystems.com.br> wrote:
> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


